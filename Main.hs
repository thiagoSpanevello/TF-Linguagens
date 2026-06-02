module Main where
 
import Lexer ( lexer )
import Parser ( parser )
import TypeChecker ( TCState(varTipos), emptyTCState, checkStmt )
import Evaluator ( runAndPrint )
import qualified SimpleMap as Map
 
main :: IO ()
main = do
  src <- getContents
  let tokens  = lexer src
  let ast     = parser tokens

  putStrLn "=== AST ==="
  putStrLn (show ast)
  putStrLn ""

  let tcState = checkStmt emptyTCState ast
  putStrLn "=== Tipos inferidos ==="
  mapM_ (\(k, t) -> putStrLn ("  " ++ k ++ " : " ++ show t))
        (Map.toAscList (varTipos tcState))
  putStrLn "Tipo OK."

  runAndPrint ast
