module Lexer where

import Data.Char (isDigit, isAlpha, isAlphaNum, isSpace)

data Token
  = TokNum  Int
  | TokBool Bool
  | TokId   String
  -- Aritméticos
  | TokSoma | TokSub | TokMult | TokDiv
  -- Relacionais
  | TokIgual | TokDif | TokMenor | TokMaior | TokMenorIg | TokMaiorIg
  -- Atribuição e pontuação
  | TokAtrib | TokPontoVirgula
  | TokAbreCh | TokFechaCh
  | TokAbrePar | TokFechaPar
  -- Palavras-chave
  | TokSe | TokEntao | TokSenao | TokEnquanto | TokFaca
  deriving (Show, Eq)

lexer :: String -> [Token]
lexer [] = []
lexer (c:cs)
  | isSpace c    = lexer cs
  | isDigit c    = lexNum  (c:cs)
  | c == '$'     = lexId cs
  | isAlpha c    = lexWord (c:cs)
  | c == '+'     = TokSoma         : lexer cs
  | c == '-'     = TokSub          : lexer cs
  | c == '*'     = TokMult         : lexer cs
  | c == '/'     = TokDiv          : lexer cs
  | c == ';'     = TokPontoVirgula : lexer cs
  | c == '{'     = TokAbreCh       : lexer cs
  | c == '}'     = TokFechaCh      : lexer cs
  | c == '('     = TokAbrePar      : lexer cs
  | c == ')'     = TokFechaPar     : lexer cs
  | c == '<'     = case cs of
      ('>':rest) -> TokIgual : lexer rest  -- <>
      ('<':'>':rest) -> TokMenorIg : lexer rest  -- <<>
      _          -> TokMenor   : lexer cs    -- 
  | c == '>'     = case cs of
      ('<':rest) -> TokDif : lexer rest  -- <>
      ('<':'>':rest) -> TokMaiorIg : lexer rest  -- <<>
      _          -> TokMaior   : lexer cs    -- >
  | c == ':'     = case cs of
      ('=':rest) -> TokAtrib : lexer rest  -- :=
      _          -> error "Erro léxico: ':' isolado, use ':='"
  | otherwise    = error ("Erro léxico: caractere inválido: " ++ [c])

lexNum :: String -> [Token]
lexNum cs = case span isDigit cs of
  (numStr, rest) -> TokNum (read numStr) : lexer rest

lexWord :: String -> [Token]
lexWord cs = case span isAlphaNum cs of
  (word, rest) -> toKeyword word : lexer rest

lexId :: String -> [Token]
lexId [] = error "Erro léxico: $ isolado"
lexId cs@(c:_)
    | isAlpha c = case span isAlphaNum cs of
      (word, rest) -> TokId ('$':word) : lexer rest
    | otherwise = error "Erro léxico: '$' deve ser seguido de uma letra"

toKeyword :: String -> Token
toKeyword "se"       = TokSe
toKeyword "entao"    = TokEntao
toKeyword "senao"    = TokSenao
toKeyword "enquanto" = TokEnquanto
toKeyword "faca"     = TokFaca
toKeyword "true"     = TokBool True
toKeyword "false"    = TokBool False
toKeyword word       = TokId word