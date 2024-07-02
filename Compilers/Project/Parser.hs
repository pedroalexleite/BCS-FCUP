{-# OPTIONS_GHC -w #-}
module Parser where
import Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t7
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 ([Decl])
	| HappyAbsSyn6 ([Expr])
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 (Var_decl)
	| HappyAbsSyn9 ([Var_decl])
	| HappyAbsSyn10 ([Type_field])
	| HappyAbsSyn11 (Type_field)
	| HappyAbsSyn12 (Var)
	| HappyAbsSyn13 (Decl)
	| HappyAbsSyn14 (Expr)

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,219) ([0,512,0,0,256,0,0,1088,0,0,0,0,0,336,0,0,0,0,0,0,0,256,0,0,128,0,0,0,32,0,0,0,0,0,0,2,0,0,0,5724,0,0,32768,0,0,0,8192,0,0,4094,0,0,0,57344,178,0,28672,89,0,0,1024,0,0,512,0,0,4,0,38656,5,0,128,0,0,0,192,0,0,0,0,0,0,4,0,65504,0,0,0,0,5120,0,0,1431,0,0,32768,0,0,8,2047,0,32769,1023,28672,89,0,47104,44,0,23552,22,0,11776,11,0,38656,5,0,52096,2,0,26048,1,0,45792,0,0,22896,0,0,11448,0,0,5724,0,0,2862,0,0,1431,0,0,0,4094,0,0,2047,0,0,0,0,0,0,0,0,0,0,0,112,0,0,56,0,0,31,0,32768,15,0,49152,7,0,57344,3,0,61440,1,0,63488,0,5724,0,0,2862,0,0,0,0,0,32768,4094,0,0,0,57344,178,0,2048,0,0,0,0,516,1024,0,0,0,0,0,38656,5,0,64,0,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,0,1431,0,0,0,0,0,0,32,0,32768,1023,28672,89,0,0,0,0,0,61440,127,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Program","Decl_list","Expr_seq","Type_id","Var_decl","Var_decl_list","Type_fields","Type_field","Var","Decl","Expr","int","id","num","while","do","if","then","else","scani","printi","var","let","in","end","function","';'","'('","')'","','","'>'","'>='","'<'","'<='","'<>'","'='","'+'","'-'","'*'","'/'","'%'","':='","':'","%eof"]
        bit_start = st Prelude.* 47
        bit_end = (st Prelude.+ 1) Prelude.* 47
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..46]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (26) = happyShift action_2
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (26) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (25) = happyShift action_7
action_2 (29) = happyShift action_8
action_2 (5) = happyGoto action_4
action_2 (8) = happyGoto action_5
action_2 (13) = happyGoto action_6
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (47) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (25) = happyShift action_7
action_4 (27) = happyShift action_13
action_4 (29) = happyShift action_8
action_4 (8) = happyGoto action_5
action_4 (13) = happyGoto action_12
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_15

action_6 _ = happyReduce_2

action_7 (16) = happyShift action_10
action_7 (12) = happyGoto action_11
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (16) = happyShift action_10
action_8 (12) = happyGoto action_9
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (31) = happyShift action_24
action_9 _ = happyFail (happyExpListPerState 9)

action_10 _ = happyReduce_14

action_11 (45) = happyShift action_23
action_11 _ = happyFail (happyExpListPerState 11)

action_12 _ = happyReduce_3

action_13 (16) = happyShift action_10
action_13 (17) = happyShift action_17
action_13 (18) = happyShift action_18
action_13 (20) = happyShift action_19
action_13 (23) = happyShift action_20
action_13 (24) = happyShift action_21
action_13 (26) = happyShift action_22
action_13 (6) = happyGoto action_14
action_13 (12) = happyGoto action_15
action_13 (14) = happyGoto action_16
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (30) = happyShift action_47
action_14 _ = happyReduce_1

action_15 (45) = happyShift action_46
action_15 _ = happyReduce_19

action_16 (34) = happyShift action_35
action_16 (35) = happyShift action_36
action_16 (36) = happyShift action_37
action_16 (37) = happyShift action_38
action_16 (38) = happyShift action_39
action_16 (39) = happyShift action_40
action_16 (40) = happyShift action_41
action_16 (41) = happyShift action_42
action_16 (42) = happyShift action_43
action_16 (43) = happyShift action_44
action_16 (44) = happyShift action_45
action_16 _ = happyReduce_4

action_17 _ = happyReduce_18

action_18 (16) = happyShift action_10
action_18 (17) = happyShift action_17
action_18 (18) = happyShift action_18
action_18 (20) = happyShift action_19
action_18 (23) = happyShift action_20
action_18 (24) = happyShift action_21
action_18 (26) = happyShift action_22
action_18 (12) = happyGoto action_15
action_18 (14) = happyGoto action_34
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (16) = happyShift action_10
action_19 (17) = happyShift action_17
action_19 (18) = happyShift action_18
action_19 (20) = happyShift action_19
action_19 (23) = happyShift action_20
action_19 (24) = happyShift action_21
action_19 (26) = happyShift action_22
action_19 (12) = happyGoto action_15
action_19 (14) = happyGoto action_33
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (31) = happyShift action_32
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (31) = happyShift action_31
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (25) = happyShift action_7
action_22 (8) = happyGoto action_29
action_22 (9) = happyGoto action_30
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (16) = happyShift action_10
action_23 (17) = happyShift action_17
action_23 (18) = happyShift action_18
action_23 (20) = happyShift action_19
action_23 (23) = happyShift action_20
action_23 (24) = happyShift action_21
action_23 (26) = happyShift action_22
action_23 (12) = happyGoto action_15
action_23 (14) = happyGoto action_28
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (16) = happyShift action_10
action_24 (10) = happyGoto action_25
action_24 (11) = happyGoto action_26
action_24 (12) = happyGoto action_27
action_24 _ = happyReduce_10

action_25 (32) = happyShift action_68
action_25 (33) = happyShift action_69
action_25 _ = happyFail (happyExpListPerState 25)

action_26 _ = happyReduce_11

action_27 (46) = happyShift action_67
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (34) = happyShift action_35
action_28 (35) = happyShift action_36
action_28 (36) = happyShift action_37
action_28 (37) = happyShift action_38
action_28 (38) = happyShift action_39
action_28 (39) = happyShift action_40
action_28 (40) = happyShift action_41
action_28 (41) = happyShift action_42
action_28 (42) = happyShift action_43
action_28 (43) = happyShift action_44
action_28 (44) = happyShift action_45
action_28 _ = happyReduce_7

action_29 _ = happyReduce_8

action_30 (25) = happyShift action_7
action_30 (27) = happyShift action_66
action_30 (8) = happyGoto action_65
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (16) = happyShift action_10
action_31 (17) = happyShift action_17
action_31 (18) = happyShift action_18
action_31 (20) = happyShift action_19
action_31 (23) = happyShift action_20
action_31 (24) = happyShift action_21
action_31 (26) = happyShift action_22
action_31 (12) = happyGoto action_15
action_31 (14) = happyGoto action_64
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (32) = happyShift action_63
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (21) = happyShift action_62
action_33 (34) = happyShift action_35
action_33 (35) = happyShift action_36
action_33 (36) = happyShift action_37
action_33 (37) = happyShift action_38
action_33 (38) = happyShift action_39
action_33 (39) = happyShift action_40
action_33 (40) = happyShift action_41
action_33 (41) = happyShift action_42
action_33 (42) = happyShift action_43
action_33 (43) = happyShift action_44
action_33 (44) = happyShift action_45
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (19) = happyShift action_61
action_34 (34) = happyShift action_35
action_34 (35) = happyShift action_36
action_34 (36) = happyShift action_37
action_34 (37) = happyShift action_38
action_34 (38) = happyShift action_39
action_34 (39) = happyShift action_40
action_34 (40) = happyShift action_41
action_34 (41) = happyShift action_42
action_34 (42) = happyShift action_43
action_34 (43) = happyShift action_44
action_34 (44) = happyShift action_45
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (16) = happyShift action_10
action_35 (17) = happyShift action_17
action_35 (18) = happyShift action_18
action_35 (20) = happyShift action_19
action_35 (23) = happyShift action_20
action_35 (24) = happyShift action_21
action_35 (26) = happyShift action_22
action_35 (12) = happyGoto action_15
action_35 (14) = happyGoto action_60
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (16) = happyShift action_10
action_36 (17) = happyShift action_17
action_36 (18) = happyShift action_18
action_36 (20) = happyShift action_19
action_36 (23) = happyShift action_20
action_36 (24) = happyShift action_21
action_36 (26) = happyShift action_22
action_36 (12) = happyGoto action_15
action_36 (14) = happyGoto action_59
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (16) = happyShift action_10
action_37 (17) = happyShift action_17
action_37 (18) = happyShift action_18
action_37 (20) = happyShift action_19
action_37 (23) = happyShift action_20
action_37 (24) = happyShift action_21
action_37 (26) = happyShift action_22
action_37 (12) = happyGoto action_15
action_37 (14) = happyGoto action_58
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (16) = happyShift action_10
action_38 (17) = happyShift action_17
action_38 (18) = happyShift action_18
action_38 (20) = happyShift action_19
action_38 (23) = happyShift action_20
action_38 (24) = happyShift action_21
action_38 (26) = happyShift action_22
action_38 (12) = happyGoto action_15
action_38 (14) = happyGoto action_57
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (16) = happyShift action_10
action_39 (17) = happyShift action_17
action_39 (18) = happyShift action_18
action_39 (20) = happyShift action_19
action_39 (23) = happyShift action_20
action_39 (24) = happyShift action_21
action_39 (26) = happyShift action_22
action_39 (12) = happyGoto action_15
action_39 (14) = happyGoto action_56
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (16) = happyShift action_10
action_40 (17) = happyShift action_17
action_40 (18) = happyShift action_18
action_40 (20) = happyShift action_19
action_40 (23) = happyShift action_20
action_40 (24) = happyShift action_21
action_40 (26) = happyShift action_22
action_40 (12) = happyGoto action_15
action_40 (14) = happyGoto action_55
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (16) = happyShift action_10
action_41 (17) = happyShift action_17
action_41 (18) = happyShift action_18
action_41 (20) = happyShift action_19
action_41 (23) = happyShift action_20
action_41 (24) = happyShift action_21
action_41 (26) = happyShift action_22
action_41 (12) = happyGoto action_15
action_41 (14) = happyGoto action_54
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (16) = happyShift action_10
action_42 (17) = happyShift action_17
action_42 (18) = happyShift action_18
action_42 (20) = happyShift action_19
action_42 (23) = happyShift action_20
action_42 (24) = happyShift action_21
action_42 (26) = happyShift action_22
action_42 (12) = happyGoto action_15
action_42 (14) = happyGoto action_53
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (16) = happyShift action_10
action_43 (17) = happyShift action_17
action_43 (18) = happyShift action_18
action_43 (20) = happyShift action_19
action_43 (23) = happyShift action_20
action_43 (24) = happyShift action_21
action_43 (26) = happyShift action_22
action_43 (12) = happyGoto action_15
action_43 (14) = happyGoto action_52
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (16) = happyShift action_10
action_44 (17) = happyShift action_17
action_44 (18) = happyShift action_18
action_44 (20) = happyShift action_19
action_44 (23) = happyShift action_20
action_44 (24) = happyShift action_21
action_44 (26) = happyShift action_22
action_44 (12) = happyGoto action_15
action_44 (14) = happyGoto action_51
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (16) = happyShift action_10
action_45 (17) = happyShift action_17
action_45 (18) = happyShift action_18
action_45 (20) = happyShift action_19
action_45 (23) = happyShift action_20
action_45 (24) = happyShift action_21
action_45 (26) = happyShift action_22
action_45 (12) = happyGoto action_15
action_45 (14) = happyGoto action_50
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (16) = happyShift action_10
action_46 (17) = happyShift action_17
action_46 (18) = happyShift action_18
action_46 (20) = happyShift action_19
action_46 (23) = happyShift action_20
action_46 (24) = happyShift action_21
action_46 (26) = happyShift action_22
action_46 (12) = happyGoto action_15
action_46 (14) = happyGoto action_49
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (16) = happyShift action_10
action_47 (17) = happyShift action_17
action_47 (18) = happyShift action_18
action_47 (20) = happyShift action_19
action_47 (23) = happyShift action_20
action_47 (24) = happyShift action_21
action_47 (26) = happyShift action_22
action_47 (12) = happyGoto action_15
action_47 (14) = happyGoto action_48
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (34) = happyShift action_35
action_48 (35) = happyShift action_36
action_48 (36) = happyShift action_37
action_48 (37) = happyShift action_38
action_48 (38) = happyShift action_39
action_48 (39) = happyShift action_40
action_48 (40) = happyShift action_41
action_48 (41) = happyShift action_42
action_48 (42) = happyShift action_43
action_48 (43) = happyShift action_44
action_48 (44) = happyShift action_45
action_48 _ = happyReduce_5

action_49 (34) = happyShift action_35
action_49 (35) = happyShift action_36
action_49 (36) = happyShift action_37
action_49 (37) = happyShift action_38
action_49 (38) = happyShift action_39
action_49 (39) = happyShift action_40
action_49 (40) = happyShift action_41
action_49 (41) = happyShift action_42
action_49 (42) = happyShift action_43
action_49 (43) = happyShift action_44
action_49 (44) = happyShift action_45
action_49 _ = happyReduce_20

action_50 _ = happyReduce_31

action_51 _ = happyReduce_30

action_52 _ = happyReduce_29

action_53 (42) = happyShift action_43
action_53 (43) = happyShift action_44
action_53 (44) = happyShift action_45
action_53 _ = happyReduce_27

action_54 (42) = happyShift action_43
action_54 (43) = happyShift action_44
action_54 (44) = happyShift action_45
action_54 _ = happyReduce_28

action_55 (34) = happyFail []
action_55 (35) = happyFail []
action_55 (36) = happyFail []
action_55 (37) = happyFail []
action_55 (38) = happyFail []
action_55 (39) = happyFail []
action_55 (40) = happyShift action_41
action_55 (41) = happyShift action_42
action_55 (42) = happyShift action_43
action_55 (43) = happyShift action_44
action_55 (44) = happyShift action_45
action_55 _ = happyReduce_25

action_56 (34) = happyFail []
action_56 (35) = happyFail []
action_56 (36) = happyFail []
action_56 (37) = happyFail []
action_56 (38) = happyFail []
action_56 (39) = happyFail []
action_56 (40) = happyShift action_41
action_56 (41) = happyShift action_42
action_56 (42) = happyShift action_43
action_56 (43) = happyShift action_44
action_56 (44) = happyShift action_45
action_56 _ = happyReduce_26

action_57 (34) = happyFail []
action_57 (35) = happyFail []
action_57 (36) = happyFail []
action_57 (37) = happyFail []
action_57 (38) = happyFail []
action_57 (39) = happyFail []
action_57 (40) = happyShift action_41
action_57 (41) = happyShift action_42
action_57 (42) = happyShift action_43
action_57 (43) = happyShift action_44
action_57 (44) = happyShift action_45
action_57 _ = happyReduce_22

action_58 (34) = happyFail []
action_58 (35) = happyFail []
action_58 (36) = happyFail []
action_58 (37) = happyFail []
action_58 (38) = happyFail []
action_58 (39) = happyFail []
action_58 (40) = happyShift action_41
action_58 (41) = happyShift action_42
action_58 (42) = happyShift action_43
action_58 (43) = happyShift action_44
action_58 (44) = happyShift action_45
action_58 _ = happyReduce_21

action_59 (34) = happyFail []
action_59 (35) = happyFail []
action_59 (36) = happyFail []
action_59 (37) = happyFail []
action_59 (38) = happyFail []
action_59 (39) = happyFail []
action_59 (40) = happyShift action_41
action_59 (41) = happyShift action_42
action_59 (42) = happyShift action_43
action_59 (43) = happyShift action_44
action_59 (44) = happyShift action_45
action_59 _ = happyReduce_24

action_60 (34) = happyFail []
action_60 (35) = happyFail []
action_60 (36) = happyFail []
action_60 (37) = happyFail []
action_60 (38) = happyFail []
action_60 (39) = happyFail []
action_60 (40) = happyShift action_41
action_60 (41) = happyShift action_42
action_60 (42) = happyShift action_43
action_60 (43) = happyShift action_44
action_60 (44) = happyShift action_45
action_60 _ = happyReduce_23

action_61 (16) = happyShift action_10
action_61 (17) = happyShift action_17
action_61 (18) = happyShift action_18
action_61 (20) = happyShift action_19
action_61 (23) = happyShift action_20
action_61 (24) = happyShift action_21
action_61 (26) = happyShift action_22
action_61 (12) = happyGoto action_15
action_61 (14) = happyGoto action_78
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (16) = happyShift action_10
action_62 (17) = happyShift action_17
action_62 (18) = happyShift action_18
action_62 (20) = happyShift action_19
action_62 (23) = happyShift action_20
action_62 (24) = happyShift action_21
action_62 (26) = happyShift action_22
action_62 (12) = happyGoto action_15
action_62 (14) = happyGoto action_77
action_62 _ = happyFail (happyExpListPerState 62)

action_63 _ = happyReduce_37

action_64 (32) = happyShift action_76
action_64 (34) = happyShift action_35
action_64 (35) = happyShift action_36
action_64 (36) = happyShift action_37
action_64 (37) = happyShift action_38
action_64 (38) = happyShift action_39
action_64 (39) = happyShift action_40
action_64 (40) = happyShift action_41
action_64 (41) = happyShift action_42
action_64 (42) = happyShift action_43
action_64 (43) = happyShift action_44
action_64 (44) = happyShift action_45
action_64 _ = happyFail (happyExpListPerState 64)

action_65 _ = happyReduce_9

action_66 (16) = happyShift action_10
action_66 (17) = happyShift action_17
action_66 (18) = happyShift action_18
action_66 (20) = happyShift action_19
action_66 (23) = happyShift action_20
action_66 (24) = happyShift action_21
action_66 (26) = happyShift action_22
action_66 (6) = happyGoto action_75
action_66 (12) = happyGoto action_15
action_66 (14) = happyGoto action_16
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (15) = happyShift action_74
action_67 (7) = happyGoto action_73
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (39) = happyShift action_71
action_68 (46) = happyShift action_72
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (16) = happyShift action_10
action_69 (11) = happyGoto action_70
action_69 (12) = happyGoto action_27
action_69 _ = happyFail (happyExpListPerState 69)

action_70 _ = happyReduce_12

action_71 (16) = happyShift action_10
action_71 (17) = happyShift action_17
action_71 (18) = happyShift action_18
action_71 (20) = happyShift action_19
action_71 (23) = happyShift action_20
action_71 (24) = happyShift action_21
action_71 (26) = happyShift action_22
action_71 (12) = happyGoto action_15
action_71 (14) = happyGoto action_82
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (15) = happyShift action_74
action_72 (7) = happyGoto action_81
action_72 _ = happyFail (happyExpListPerState 72)

action_73 _ = happyReduce_13

action_74 _ = happyReduce_6

action_75 (28) = happyShift action_80
action_75 (30) = happyShift action_47
action_75 _ = happyFail (happyExpListPerState 75)

action_76 _ = happyReduce_36

action_77 (22) = happyShift action_79
action_77 (34) = happyShift action_35
action_77 (35) = happyShift action_36
action_77 (36) = happyShift action_37
action_77 (37) = happyShift action_38
action_77 (38) = happyShift action_39
action_77 (39) = happyShift action_40
action_77 (40) = happyShift action_41
action_77 (41) = happyShift action_42
action_77 (42) = happyShift action_43
action_77 (43) = happyShift action_44
action_77 (44) = happyShift action_45
action_77 _ = happyReduce_32

action_78 (34) = happyShift action_35
action_78 (35) = happyShift action_36
action_78 (36) = happyShift action_37
action_78 (37) = happyShift action_38
action_78 (38) = happyShift action_39
action_78 (39) = happyShift action_40
action_78 (40) = happyShift action_41
action_78 (41) = happyShift action_42
action_78 (42) = happyShift action_43
action_78 (43) = happyShift action_44
action_78 (44) = happyShift action_45
action_78 _ = happyReduce_34

action_79 (16) = happyShift action_10
action_79 (17) = happyShift action_17
action_79 (18) = happyShift action_18
action_79 (20) = happyShift action_19
action_79 (23) = happyShift action_20
action_79 (24) = happyShift action_21
action_79 (26) = happyShift action_22
action_79 (12) = happyGoto action_15
action_79 (14) = happyGoto action_84
action_79 _ = happyFail (happyExpListPerState 79)

action_80 _ = happyReduce_35

action_81 (39) = happyShift action_83
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (34) = happyShift action_35
action_82 (35) = happyShift action_36
action_82 (36) = happyShift action_37
action_82 (37) = happyShift action_38
action_82 (38) = happyShift action_39
action_82 (39) = happyShift action_40
action_82 (40) = happyShift action_41
action_82 (41) = happyShift action_42
action_82 (42) = happyShift action_43
action_82 (43) = happyShift action_44
action_82 (44) = happyShift action_45
action_82 _ = happyReduce_16

action_83 (16) = happyShift action_10
action_83 (17) = happyShift action_17
action_83 (18) = happyShift action_18
action_83 (20) = happyShift action_19
action_83 (23) = happyShift action_20
action_83 (24) = happyShift action_21
action_83 (26) = happyShift action_22
action_83 (12) = happyGoto action_15
action_83 (14) = happyGoto action_85
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (34) = happyShift action_35
action_84 (35) = happyShift action_36
action_84 (36) = happyShift action_37
action_84 (37) = happyShift action_38
action_84 (38) = happyShift action_39
action_84 (39) = happyShift action_40
action_84 (40) = happyShift action_41
action_84 (41) = happyShift action_42
action_84 (42) = happyShift action_43
action_84 (43) = happyShift action_44
action_84 (44) = happyShift action_45
action_84 _ = happyReduce_33

action_85 (34) = happyShift action_35
action_85 (35) = happyShift action_36
action_85 (36) = happyShift action_37
action_85 (37) = happyShift action_38
action_85 (38) = happyShift action_39
action_85 (39) = happyShift action_40
action_85 (40) = happyShift action_41
action_85 (41) = happyShift action_42
action_85 (42) = happyShift action_43
action_85 (43) = happyShift action_44
action_85 (44) = happyShift action_45
action_85 _ = happyReduce_17

happyReduce_1 = happyReduce 4 4 happyReduction_1
happyReduction_1 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (LetP happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_2 = happySpecReduce_1  5 happyReduction_2
happyReduction_2 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1]
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_2  5 happyReduction_3
happyReduction_3 (HappyAbsSyn13  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_2 : happy_var_1
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  6 happyReduction_4
happyReduction_4 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn6
		 ([happy_var_1]
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_3  6 happyReduction_5
happyReduction_5 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_3 : happy_var_1
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  7 happyReduction_6
happyReduction_6 _
	 =  HappyAbsSyn7
		 (TYPE_INT
	)

happyReduce_7 = happyReduce 4 8 happyReduction_7
happyReduction_7 ((HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (VarDecl happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_1  9 happyReduction_8
happyReduction_8 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn9
		 ([happy_var_1]
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_2  9 happyReduction_9
happyReduction_9 (HappyAbsSyn8  happy_var_2)
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_2 : happy_var_1
	)
happyReduction_9 _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_0  10 happyReduction_10
happyReduction_10  =  HappyAbsSyn10
		 ([]
	)

happyReduce_11 = happySpecReduce_1  10 happyReduction_11
happyReduction_11 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 ([happy_var_1]
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  10 happyReduction_12
happyReduction_12 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_3 : happy_var_1
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  11 happyReduction_13
happyReduction_13 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 ((happy_var_1, happy_var_3)
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_1  12 happyReduction_14
happyReduction_14 (HappyTerminal (TOK_ID happy_var_1))
	 =  HappyAbsSyn12
		 (Var_Simple happy_var_1
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_1  13 happyReduction_15
happyReduction_15 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn13
		 (VAR_DECL happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happyReduce 7 13 happyReduction_16
happyReduction_16 ((HappyAbsSyn14  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (PROC_DECL happy_var_2 happy_var_4 happy_var_7
	) `HappyStk` happyRest

happyReduce_17 = happyReduce 9 13 happyReduction_17
happyReduction_17 ((HappyAbsSyn14  happy_var_9) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (FUN_DECL happy_var_2 happy_var_4 happy_var_7 happy_var_9
	) `HappyStk` happyRest

happyReduce_18 = happySpecReduce_1  14 happyReduction_18
happyReduction_18 (HappyTerminal (TOK_NUM happy_var_1))
	 =  HappyAbsSyn14
		 (Num happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  14 happyReduction_19
happyReduction_19 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn14
		 (Lvalue happy_var_1
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  14 happyReduction_20
happyReduction_20 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn14
		 (Assign happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  14 happyReduction_21
happyReduction_21 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (OpExpr Less happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  14 happyReduction_22
happyReduction_22 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (OpExpr LessEqual happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  14 happyReduction_23
happyReduction_23 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (OpExpr Less happy_var_3 happy_var_1
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  14 happyReduction_24
happyReduction_24 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (OpExpr LessEqual happy_var_3 happy_var_1
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  14 happyReduction_25
happyReduction_25 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (OpExpr Equal happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  14 happyReduction_26
happyReduction_26 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (OpExpr NotEqual happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  14 happyReduction_27
happyReduction_27 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (OpExpr Minus happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  14 happyReduction_28
happyReduction_28 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (OpExpr Add happy_var_1 happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  14 happyReduction_29
happyReduction_29 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (OpExpr Times happy_var_1 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  14 happyReduction_30
happyReduction_30 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (OpExpr Div happy_var_1 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  14 happyReduction_31
happyReduction_31 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (OpExpr Mod happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happyReduce 4 14 happyReduction_32
happyReduction_32 ((HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (If happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_33 = happyReduce 6 14 happyReduction_33
happyReduction_33 ((HappyAbsSyn14  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (IfE happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_34 = happyReduce 4 14 happyReduction_34
happyReduction_34 ((HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (While happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_35 = happyReduce 5 14 happyReduction_35
happyReduction_35 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (Let happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_36 = happyReduce 4 14 happyReduction_36
happyReduction_36 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (Printi happy_var_3
	) `HappyStk` happyRest

happyReduce_37 = happySpecReduce_3  14 happyReduction_37
happyReduction_37 _
	_
	_
	 =  HappyAbsSyn14
		 (Scani
	)

happyNewToken action sts stk [] =
	action 47 47 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TOK_INT -> cont 15;
	TOK_ID happy_dollar_dollar -> cont 16;
	TOK_NUM happy_dollar_dollar -> cont 17;
	TOK_WHILE -> cont 18;
	TOK_DO -> cont 19;
	TOK_IF -> cont 20;
	TOK_THEN -> cont 21;
	TOK_ELSE -> cont 22;
	TOK_SCANI -> cont 23;
	TOK_PRINTI -> cont 24;
	TOK_VAR -> cont 25;
	TOK_LET -> cont 26;
	TOK_IN -> cont 27;
	TOK_END -> cont 28;
	TOK_FUNCTION -> cont 29;
	TOK_SEMICOLON -> cont 30;
	TOK_LPAREN -> cont 31;
	TOK_RPAREN -> cont 32;
	TOK_COMMA -> cont 33;
	TOK_BIGGER -> cont 34;
	TOK_BIGGEREQUAL -> cont 35;
	TOK_SMALLER -> cont 36;
	TOK_SMALLEREQUAL -> cont 37;
	TOK_DIFF -> cont 38;
	TOK_EQUAL -> cont 39;
	TOK_PLUS -> cont 40;
	TOK_MINUS -> cont 41;
	TOK_MULTI -> cont 42;
	TOK_DIV -> cont 43;
	TOK_PERCENT -> cont 44;
	TOK_DEFINE -> cont 45;
	TOK_COLON -> cont 46;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 47 tk tks = happyError' (tks, explist)
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


data Program
    = LetP [Decl] [Expr]
    deriving Show

data Expr
    = Num Int
    | Lvalue Var
    | Assign Var Expr
    | OpExpr Operator Expr Expr
    | If Expr Expr
    | IfE Expr Expr Expr
    | While Expr Expr
    | Let [Var_decl] [Expr]
    | Printi Expr
    | Scani
    deriving Show

data Operator
        = Less | LessEqual | Equal | NotEqual | Add  | Minus | Times | Div  | Mod
        deriving Show

data Var
    = Var_Simple String
    deriving Show

data Decl
    = VAR_DECL Var_decl
    | PROC_DECL Var [Type_field] Expr
    | FUN_DECL Var [Type_field] Type_id Expr
    deriving Show

data Var_decl
    = VarDecl Var Expr
    deriving Show

data Type_id
    = TYPE_INT
    deriving Show

type Type_field
    = (Var, Type_id)

parseError :: [Token] -> a
parseError toks = error "parse error"
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
