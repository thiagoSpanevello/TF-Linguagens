module TypeChecker where

import Parser ( Op(..), Valor(VBool, VInt), Exp(..), Stmt(..) )
import qualified SimpleMap as Map

data Tipo
  = TInt
  | TBool
  | TList Tipo
  | TList_
  | TUnit
  deriving (Show, Eq)

type TipoEnv = Map.Map String Tipo

type FuncTipoEnv = Map.Map String ([Tipo], Tipo)


data TCState = TCState
  { varTipos  :: TipoEnv
  , funcTipos :: FuncTipoEnv
  } deriving (Show)

emptyTCState :: TCState
emptyTCState = TCState Map.empty Map.empty

inferExp :: TCState -> Exp -> Tipo
inferExp _ (Lit (VInt  _)) = TInt
inferExp _ (Lit (VBool _)) = TBool

inferExp st (Var x) =
  case Map.lookup x (varTipos st) of
    Just t  -> t
    Nothing -> error ("Type error: variavel nao declarada: " ++ x)

inferExp st (BinOp op e1 e2) =
  let t1 = inferExp st e1
      t2 = inferExp st e2
  in checkOp op t1 t2

checkOp :: Op -> Tipo -> Tipo -> Tipo

checkOp Soma  TInt TInt = TInt
checkOp Sub   TInt TInt = TInt
checkOp Mult  TInt TInt = TInt
checkOp Div   TInt TInt = TInt

checkOp Igual   TInt TInt = TBool
checkOp Dif     TInt TInt = TBool
checkOp Menor   TInt TInt = TBool
checkOp Maior   TInt TInt = TBool
checkOp MenorIg TInt TInt = TBool
checkOp MaiorIg TInt TInt = TBool

checkOp Igual  TBool TBool = TBool
checkOp Dif    TBool TBool = TBool

checkOp op t1 t2 =
  error ("Type error: operador " ++ show op
         ++ " não aplicável a " ++ show t1 ++ " e " ++ show t2)

checkStmt :: TCState -> Stmt -> TCState

checkStmt st (Atrib x e) =
  let t = inferExp st e
  in st { varTipos = Map.insert x t (varTipos st) }

checkStmt st (Seq s1 s2) =
  let st' = checkStmt st s1
  in checkStmt st' s2

checkStmt st (Se cond sThen sSenao) =
  let tc = inferExp st cond
  in if tc /= TBool
     then error ("Type error: condição do 'se' deve ser Bool, obteve " ++ show tc)
     else let st1 = checkStmt st sThen
              st2 = checkStmt st sSenao
          in st { varTipos = Map.union (varTipos st1) (varTipos st2) }

checkStmt st (Enquanto cond corpo) =
  let tc = inferExp st cond
  in if tc /= TBool
     then error ("Type error: condição do 'enquanto' deve ser Bool, obteve " ++ show tc)
     else checkStmt st corpo

checkStmt st (FuncDecl nome params corpo) =
  let paramTipos = map (, TInt) params
      localEnv   = Map.fromList (("$ret", TInt) : paramTipos)
      localSt    = st { varTipos  = Map.union localEnv (varTipos st)
                      , funcTipos = Map.insert nome (map snd paramTipos, TInt) (funcTipos st) }
      _          = checkStmt localSt corpo
      newFuncTipos = Map.insert nome (map snd paramTipos, TInt) (funcTipos st)
  in st { funcTipos = newFuncTipos }

checkStmt st (Call nome args) =
  case Map.lookup nome (funcTipos st) of
    Nothing -> error ("Type error: função não declarada: " ++ nome)
    Just (paramTs, retT) ->
      let nParams = length paramTs
          nArgs   = length args
      in if nParams /= nArgs
         then error ("Type error: função " ++ nome
                     ++ " espera " ++ show nParams
                     ++ " argumento(s), recebeu " ++ show nArgs)
         else let argTs = map (inferExp st) args
                  mismatches = filter (uncurry (/=)) (zip paramTs argTs)
              in if not (null mismatches)
                 then error ("Type error: tipos de argumentos incorretos em chamada de " ++ nome)
                 else st { varTipos = Map.insert "$ret" retT (varTipos st) }

checkStmt st (ListaDecl x exprs) =
  let ts = map (inferExp st) exprs
      t = case ts of
            []    -> TList_
            (h:_) -> if all (== h) ts
                     then TList h
                     else error ("Type error: lista heterogênea em " ++ x)
  in st { varTipos = Map.insert x t (varTipos st) }

checkStmt st (HeadCmd x listaExp) =
  let t = inferExp st listaExp
  in case t of
       TList et -> st { varTipos = Map.insert x et (varTipos st) }
       TList_   -> error "Type error: head em lista vazia"
       _        -> error ("Type error: head espera lista, obteve " ++ show t)

checkStmt st (TailCmd x listaExp) =
  let t = inferExp st listaExp
  in case t of
       TList et -> st { varTipos = Map.insert x (TList et) (varTipos st) }
       TList_   -> error "Type error: tail em lista vazia"
       _        -> error ("Type error: tail espera lista, obteve " ++ show t)

typeCheck :: Stmt -> Either String TCState
typeCheck prog =
  case checkStmt emptyTCState prog of
    st -> Right st

typeCheckAndReport :: Stmt -> IO ()
typeCheckAndReport prog = do
  putStrLn "=== Verificação de tipos ==="
  let st = checkStmt emptyTCState prog
  putStrLn "Tipos inferidos:"
  mapM_ (\(k, t) -> putStrLn ("  " ++ k ++ " : " ++ show t))
        (Map.toAscList (varTipos st))
  putStrLn "OK – programa bem tipado."