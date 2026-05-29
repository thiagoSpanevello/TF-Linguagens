module Evaluator where

import Parser ( Op(..), Valor(VBool, VInt), Exp(..), Stmt(..) )
import qualified SimpleMap as Map

data RuntimeVal
  = RInt  Int
  | RBool Bool
  | RList [RuntimeVal]
  deriving (Eq)

instance Show RuntimeVal where
  show (RInt  n) = show n
  show (RBool b) = if b then "true" else "false"
  show (RList vs) = "[" ++ intercalateShow ", " vs ++ "]"
    where
      intercalateShow _ []     = ""
      intercalateShow _ [x]    = show x
      intercalateShow sep (x:xs) = show x ++ sep ++ intercalateShow sep xs

type Env = Map.Map String RuntimeVal

type FuncEnv = Map.Map String ([String], Stmt)

data State = State
  { varEnv  :: Env
  , funcEnv :: FuncEnv
  } deriving (Show)

emptyState :: State
emptyState = State Map.empty Map.empty

eval :: State -> Exp -> RuntimeVal

eval _ (Lit (VInt  n)) = RInt  n
eval _ (Lit (VBool b)) = RBool b

eval st (Var x) =
  case Map.lookup x (varEnv st) of
    Just v  -> v
    Nothing -> error ("variavel nao declarada: " ++ x)

eval st (BinOp op e1 e2) =
  let v1 = eval st e1
      v2 = eval st e2
  in applyOp op v1 v2

applyOp :: Op -> RuntimeVal -> RuntimeVal -> RuntimeVal

-- Aritméticos (inteiros)
applyOp Soma  (RInt a) (RInt b) = RInt (a + b)
applyOp Sub   (RInt a) (RInt b) = RInt (a - b)
applyOp Mult  (RInt a) (RInt b) = RInt (a * b)
applyOp Div   (RInt _) (RInt 0) = error "Divisão por zero"
applyOp Div   (RInt a) (RInt b) = RInt (a `div` b)

-- Relacionais (int <> int => bool)
applyOp Igual   (RInt a) (RInt b) = RBool (a == b)
applyOp Dif     (RInt a) (RInt b) = RBool (a /= b)
applyOp Menor   (RInt a) (RInt b) = RBool (a <  b)
applyOp Maior   (RInt a) (RInt b) = RBool (a >  b)
applyOp MenorIg (RInt a) (RInt b) = RBool (a <= b)
applyOp MaiorIg (RInt a) (RInt b) = RBool (a >= b)

-- Igualdade booleana
applyOp Igual (RBool a) (RBool b) = RBool (a == b)
applyOp Dif   (RBool a) (RBool b) = RBool (a /= b)

applyOp op v1 v2 =
  error ("Operação inválida: " ++ show op
         ++ " em " ++ show v1 ++ " e " ++ show v2)

exec :: State -> Stmt -> State

exec st (Atrib x e) =
  let v = eval st e
  in st { varEnv = Map.insert x v (varEnv st) }

exec st (Seq s1 s2) =
  let st' = exec st s1
  in exec st' s2

exec st (Se cond sThen sSenao) =
  case eval st cond of
    RBool True  -> exec st sThen
    RBool False -> exec st sSenao
    _           -> error "Condição do 'se' deve ser booleana"

exec st (Enquanto cond corpo) =
  case eval st cond of
    RBool False -> st
    RBool True  ->
      let st' = exec st corpo
      in exec st' (Enquanto cond corpo)
    _ -> error "Condição do 'enquanto' deve ser booleana"

exec st (FuncDecl nome params corpo) =
  st { funcEnv = Map.insert nome (params, corpo) (funcEnv st) }

exec st (Call nome args) =
  case Map.lookup nome (funcEnv st) of
    Nothing -> error ("Função não declarada: " ++ nome)
    Just (params, corpo) ->
      let argVals   = map (eval st) args
          localEnv  = Map.fromList (zip params argVals)
          localState = State localEnv (funcEnv st)
          finalState = exec localState corpo
          retVal = Map.lookup "$ret" (varEnv finalState)
          outerEnv = case retVal of
                       Just v  -> Map.insert "$ret" v (varEnv st)
                       Nothing -> varEnv st
      in st { varEnv = outerEnv }

exec st (ListaDecl x exprs) =
  let vs = map (eval st) exprs
  in st { varEnv = Map.insert x (RList vs) (varEnv st) }

exec st (HeadCmd x listaExp) =
  case eval st listaExp of
    RList []    -> error "head: lista vazia"
    RList (v:_) -> st { varEnv = Map.insert x v (varEnv st) }
    _           -> error "head: esperava uma lista"

exec st (TailCmd x listaExp) =
  case eval st listaExp of
    RList []     -> error "tail: lista vazia"
    RList (_:vs) -> st { varEnv = Map.insert x (RList vs) (varEnv st) }
    _            -> error "tail: esperava uma lista"


run :: Stmt -> State
run = exec emptyState

runAndPrint :: Stmt -> IO ()
runAndPrint prog = do
  let finalState = run prog
  putStrLn "=== Estado final ==="
  mapM_ (\(k, v) -> putStrLn (k ++ " = " ++ show v))
        (Map.toAscList (varEnv finalState))
