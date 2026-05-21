{-# OPTIONS_GHC -w #-}
module Parser where
import Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,123) ([256,4608,128,2304,0,4,0,1,28,8,14,4,0,0,4092,64,0,0,0,0,0,14336,4096,57344,16511,3584,1024,1024,18432,0,0,65024,7,224,64,112,32,56,16,28,8,14,4,7,32770,3,49153,32769,57344,16384,28672,8192,0,1024,57344,4223,0,256,1024,18432,0,0,256,4608,3840,0,1920,0,960,0,480,0,15600,0,7800,0,0,0,0,0,12,0,6,0,2560,0,1280,0,0,0,8192,0,64,256,4608,0,40,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Prog","Stmt","Exp","num","bool","id","'+'","'-'","'*'","'/'","'<>'","'><'","'<'","'>'","'<<>'","'><>'","':='","';'","'{'","'}'","'('","')'","se","entao","senao","enquanto","faca","%eof"]
        bit_start = st Prelude.* 31
        bit_end = (st Prelude.+ 1) Prelude.* 31
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..30]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (9) = happyShift action_3
action_0 (26) = happyShift action_4
action_0 (29) = happyShift action_5
action_0 (4) = happyGoto action_6
action_0 (5) = happyGoto action_2
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (9) = happyShift action_3
action_1 (26) = happyShift action_4
action_1 (29) = happyShift action_5
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (21) = happyShift action_14
action_2 _ = happyReduce_1

action_3 (20) = happyShift action_13
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (7) = happyShift action_8
action_4 (8) = happyShift action_9
action_4 (9) = happyShift action_10
action_4 (24) = happyShift action_11
action_4 (6) = happyGoto action_12
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (7) = happyShift action_8
action_5 (8) = happyShift action_9
action_5 (9) = happyShift action_10
action_5 (24) = happyShift action_11
action_5 (6) = happyGoto action_7
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (31) = happyAccept
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (10) = happyShift action_17
action_7 (11) = happyShift action_18
action_7 (12) = happyShift action_19
action_7 (13) = happyShift action_20
action_7 (14) = happyShift action_21
action_7 (15) = happyShift action_22
action_7 (16) = happyShift action_23
action_7 (17) = happyShift action_24
action_7 (18) = happyShift action_25
action_7 (19) = happyShift action_26
action_7 (30) = happyShift action_29
action_7 _ = happyFail (happyExpListPerState 7)

action_8 _ = happyReduce_17

action_9 _ = happyReduce_18

action_10 _ = happyReduce_19

action_11 (7) = happyShift action_8
action_11 (8) = happyShift action_9
action_11 (9) = happyShift action_10
action_11 (24) = happyShift action_11
action_11 (6) = happyGoto action_28
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (10) = happyShift action_17
action_12 (11) = happyShift action_18
action_12 (12) = happyShift action_19
action_12 (13) = happyShift action_20
action_12 (14) = happyShift action_21
action_12 (15) = happyShift action_22
action_12 (16) = happyShift action_23
action_12 (17) = happyShift action_24
action_12 (18) = happyShift action_25
action_12 (19) = happyShift action_26
action_12 (27) = happyShift action_27
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (7) = happyShift action_8
action_13 (8) = happyShift action_9
action_13 (9) = happyShift action_10
action_13 (24) = happyShift action_11
action_13 (6) = happyGoto action_16
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (9) = happyShift action_3
action_14 (26) = happyShift action_4
action_14 (29) = happyShift action_5
action_14 (5) = happyGoto action_15
action_14 _ = happyFail (happyExpListPerState 14)

action_15 _ = happyReduce_2

action_16 (10) = happyShift action_17
action_16 (11) = happyShift action_18
action_16 (12) = happyShift action_19
action_16 (13) = happyShift action_20
action_16 (14) = happyShift action_21
action_16 (15) = happyShift action_22
action_16 (16) = happyShift action_23
action_16 (17) = happyShift action_24
action_16 (18) = happyShift action_25
action_16 (19) = happyShift action_26
action_16 _ = happyReduce_3

action_17 (7) = happyShift action_8
action_17 (8) = happyShift action_9
action_17 (9) = happyShift action_10
action_17 (24) = happyShift action_11
action_17 (6) = happyGoto action_42
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (7) = happyShift action_8
action_18 (8) = happyShift action_9
action_18 (9) = happyShift action_10
action_18 (24) = happyShift action_11
action_18 (6) = happyGoto action_41
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (7) = happyShift action_8
action_19 (8) = happyShift action_9
action_19 (9) = happyShift action_10
action_19 (24) = happyShift action_11
action_19 (6) = happyGoto action_40
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (7) = happyShift action_8
action_20 (8) = happyShift action_9
action_20 (9) = happyShift action_10
action_20 (24) = happyShift action_11
action_20 (6) = happyGoto action_39
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (7) = happyShift action_8
action_21 (8) = happyShift action_9
action_21 (9) = happyShift action_10
action_21 (24) = happyShift action_11
action_21 (6) = happyGoto action_38
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (7) = happyShift action_8
action_22 (8) = happyShift action_9
action_22 (9) = happyShift action_10
action_22 (24) = happyShift action_11
action_22 (6) = happyGoto action_37
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (7) = happyShift action_8
action_23 (8) = happyShift action_9
action_23 (9) = happyShift action_10
action_23 (24) = happyShift action_11
action_23 (6) = happyGoto action_36
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (7) = happyShift action_8
action_24 (8) = happyShift action_9
action_24 (9) = happyShift action_10
action_24 (24) = happyShift action_11
action_24 (6) = happyGoto action_35
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (7) = happyShift action_8
action_25 (8) = happyShift action_9
action_25 (9) = happyShift action_10
action_25 (24) = happyShift action_11
action_25 (6) = happyGoto action_34
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (7) = happyShift action_8
action_26 (8) = happyShift action_9
action_26 (9) = happyShift action_10
action_26 (24) = happyShift action_11
action_26 (6) = happyGoto action_33
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (22) = happyShift action_32
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (10) = happyShift action_17
action_28 (11) = happyShift action_18
action_28 (12) = happyShift action_19
action_28 (13) = happyShift action_20
action_28 (14) = happyShift action_21
action_28 (15) = happyShift action_22
action_28 (16) = happyShift action_23
action_28 (17) = happyShift action_24
action_28 (18) = happyShift action_25
action_28 (19) = happyShift action_26
action_28 (25) = happyShift action_31
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (22) = happyShift action_30
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (9) = happyShift action_3
action_30 (26) = happyShift action_4
action_30 (29) = happyShift action_5
action_30 (5) = happyGoto action_44
action_30 _ = happyFail (happyExpListPerState 30)

action_31 _ = happyReduce_16

action_32 (9) = happyShift action_3
action_32 (26) = happyShift action_4
action_32 (29) = happyShift action_5
action_32 (5) = happyGoto action_43
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (10) = happyShift action_17
action_33 (11) = happyShift action_18
action_33 (12) = happyShift action_19
action_33 (13) = happyShift action_20
action_33 _ = happyReduce_15

action_34 (10) = happyShift action_17
action_34 (11) = happyShift action_18
action_34 (12) = happyShift action_19
action_34 (13) = happyShift action_20
action_34 _ = happyReduce_14

action_35 (10) = happyShift action_17
action_35 (11) = happyShift action_18
action_35 (12) = happyShift action_19
action_35 (13) = happyShift action_20
action_35 _ = happyReduce_13

action_36 (10) = happyShift action_17
action_36 (11) = happyShift action_18
action_36 (12) = happyShift action_19
action_36 (13) = happyShift action_20
action_36 _ = happyReduce_12

action_37 (10) = happyShift action_17
action_37 (11) = happyShift action_18
action_37 (12) = happyShift action_19
action_37 (13) = happyShift action_20
action_37 (16) = happyShift action_23
action_37 (17) = happyShift action_24
action_37 (18) = happyShift action_25
action_37 (19) = happyShift action_26
action_37 _ = happyReduce_11

action_38 (10) = happyShift action_17
action_38 (11) = happyShift action_18
action_38 (12) = happyShift action_19
action_38 (13) = happyShift action_20
action_38 (16) = happyShift action_23
action_38 (17) = happyShift action_24
action_38 (18) = happyShift action_25
action_38 (19) = happyShift action_26
action_38 _ = happyReduce_10

action_39 _ = happyReduce_9

action_40 _ = happyReduce_8

action_41 (12) = happyShift action_19
action_41 (13) = happyShift action_20
action_41 _ = happyReduce_7

action_42 (12) = happyShift action_19
action_42 (13) = happyShift action_20
action_42 _ = happyReduce_6

action_43 (21) = happyShift action_14
action_43 (23) = happyShift action_46
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (21) = happyShift action_14
action_44 (23) = happyShift action_45
action_44 _ = happyFail (happyExpListPerState 44)

action_45 _ = happyReduce_5

action_46 (28) = happyShift action_47
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (22) = happyShift action_48
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (9) = happyShift action_3
action_48 (26) = happyShift action_4
action_48 (29) = happyShift action_5
action_48 (5) = happyGoto action_49
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (21) = happyShift action_14
action_49 (23) = happyShift action_50
action_49 _ = happyFail (happyExpListPerState 49)

action_50 _ = happyReduce_4

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_3  5 happyReduction_2
happyReduction_2 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Seq happy_var_1 happy_var_3
	)
happyReduction_2 _ _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_3  5 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_3)
	_
	(HappyTerminal (TokId happy_var_1))
	 =  HappyAbsSyn5
		 (Atrib happy_var_1 happy_var_3
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happyReduce 10 5 happyReduction_4
happyReduction_4 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_9) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (Se happy_var_2 happy_var_5 happy_var_9
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 6 5 happyReduction_5
happyReduction_5 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (Enquanto happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_6 = happySpecReduce_3  6 happyReduction_6
happyReduction_6 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (BinOp Soma happy_var_1 happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  6 happyReduction_7
happyReduction_7 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (BinOp Sub  happy_var_1 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  6 happyReduction_8
happyReduction_8 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (BinOp Mult happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  6 happyReduction_9
happyReduction_9 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (BinOp Div  happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  6 happyReduction_10
happyReduction_10 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (BinOp Igual    happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  6 happyReduction_11
happyReduction_11 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (BinOp Dif      happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  6 happyReduction_12
happyReduction_12 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (BinOp Menor    happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  6 happyReduction_13
happyReduction_13 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (BinOp Maior    happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  6 happyReduction_14
happyReduction_14 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (BinOp MenorIg  happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  6 happyReduction_15
happyReduction_15 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (BinOp MaiorIg  happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  6 happyReduction_16
happyReduction_16 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (happy_var_2
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  6 happyReduction_17
happyReduction_17 (HappyTerminal (TokNum happy_var_1))
	 =  HappyAbsSyn6
		 (Lit (VInt  happy_var_1)
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  6 happyReduction_18
happyReduction_18 (HappyTerminal (TokBool happy_var_1))
	 =  HappyAbsSyn6
		 (Lit (VBool happy_var_1)
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  6 happyReduction_19
happyReduction_19 (HappyTerminal (TokId happy_var_1))
	 =  HappyAbsSyn6
		 (Var happy_var_1
	)
happyReduction_19 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 31 31 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokNum happy_dollar_dollar -> cont 7;
	TokBool happy_dollar_dollar -> cont 8;
	TokId happy_dollar_dollar -> cont 9;
	TokSoma -> cont 10;
	TokSub -> cont 11;
	TokMult -> cont 12;
	TokDiv -> cont 13;
	TokIgual -> cont 14;
	TokDif -> cont 15;
	TokMenor -> cont 16;
	TokMaior -> cont 17;
	TokMenorIg -> cont 18;
	TokMaiorIg -> cont 19;
	TokAtrib -> cont 20;
	TokPontoVirgula -> cont 21;
	TokAbreCh -> cont 22;
	TokFechaCh -> cont 23;
	TokAbrePar -> cont 24;
	TokFechaPar -> cont 25;
	TokSe -> cont 26;
	TokEntao -> cont 27;
	TokSenao -> cont 28;
	TokEnquanto -> cont 29;
	TokFaca -> cont 30;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 31 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parser tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError toks = error ("Erro sintático: " ++ show toks)

-- AST
data Stmt
  = Atrib    String Exp
  | Seq      Stmt Stmt
  | Se       Exp Stmt Stmt
  | Enquanto Exp Stmt
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
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
