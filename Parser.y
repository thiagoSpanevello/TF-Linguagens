{
module Parser where
import Lexer
}

%name parser
%tokentype { Token }
%error { parseError }

%token
    num         { TokNum $$        }
    bool        { TokBool $$       }
    id          { TokId $$         }
    '+'         { TokSoma          }
    '-'         { TokSub           }
    '*'         { TokMult          }
    '/'         { TokDiv           }
    '<>'        { TokIgual         }
    '><'        { TokDif           }
    '<'         { TokMenor         }
    '>'         { TokMaior         }
    '<<>'       { TokMenorIg       }
    '><>'       { TokMaiorIg       }
    ':='        { TokAtrib         }
    ';'         { TokPontoVirgula  }
    '{'         { TokAbreCh        }
    '}'         { TokFechaCh       }
    '('         { TokAbrePar       }
    ')'         { TokFechaPar      }
    '['         { TokAbreCol       }
    ']'         { TokFechaCol      }
    ','         { TokVirgula       }
    se          { TokSe            }
    entao       { TokEntao         }
    senao       { TokSenao         }
    enquanto    { TokEnquanto      }
    faca        { TokFaca          }
    func        { TokFunc          }
    call        { TokCall          }
    head        { TokHead          }
    tail        { TokTail          }

%right ':='
%left ';'
%left '<>' '><'
%left '<' '>' '<<>' '><>'
%left '+' '-'
%left '*' '/'

%%

Prog : Stmt                              { $1 }

Stmt : Stmt ';' Stmt                     { Seq $1 $3 }
     | id ':=' Exp                       { Atrib $1 $3 }
     | se Exp entao '{' Stmt '}'
         senao '{' Stmt '}'             { Se $2 $5 $9 }
     | enquanto Exp faca '{' Stmt '}'   { Enquanto $2 $5 }
     | func id '(' Params ')' '{' Stmt '}'
                                         { FuncDecl $2 $4 $7 }
     | call id '(' Args ')'             { Call $2 $4 }
     | id ':=' '[' Args ']'             { ListaDecl $1 $4 }
     | id ':=' head '(' Exp ')'         { HeadCmd $1 $5 }
     | id ':=' tail '(' Exp ')'         { TailCmd $1 $5 }

Params :                                 { [] }
       | id                              { [$1] }
       | Params ',' id                   { $1 ++ [$3] }

Args :                                   { [] }
     | Exp                               { [$1] }
     | Args ',' Exp                      { $1 ++ [$3] }

Exp : Exp '+' Exp                        { BinOp Soma $1 $3 }
    | Exp '-' Exp                        { BinOp Sub  $1 $3 }
    | Exp '*' Exp                        { BinOp Mult $1 $3 }
    | Exp '/' Exp                        { BinOp Div  $1 $3 }
    | Exp '<>' Exp                       { BinOp Igual    $1 $3 }
    | Exp '><' Exp                       { BinOp Dif      $1 $3 }
    | Exp '<'  Exp                       { BinOp Menor    $1 $3 }
    | Exp '>'  Exp                       { BinOp Maior    $1 $3 }
    | Exp '<<>' Exp                      { BinOp MenorIg  $1 $3 }
    | Exp '><>' Exp                      { BinOp MaiorIg  $1 $3 }
    | '(' Exp ')'                        { $2 }
    | num                                { Lit (VInt  $1) }
    | bool                               { Lit (VBool $1) }
    | id                                 { Var $1 }

{
parseError :: [Token] -> a
parseError toks = error ("Erro sintático: " ++ show toks)

data Stmt
  = Atrib    String Exp           
  | Seq      Stmt   Stmt          
  | Se       Exp    Stmt  Stmt    
  | Enquanto Exp    Stmt          

  | FuncDecl String [String] Stmt 
  | Call     String [Exp]        
  | ListaDecl String [Exp]        
  | HeadCmd  String Exp          
  | TailCmd  String Exp           
  deriving (Show, Eq)

data Exp
  = Lit   Valor
  | Var   String
  | BinOp Op Exp Exp
  deriving (Show, Eq)

data Valor
  = VInt  Int
  | VBool Bool
  deriving (Show, Eq)

data Op
  = Soma | Sub | Mult | Div
  | Igual | Dif | Menor | Maior | MenorIg | MaiorIg
  deriving (Show, Eq)
}
