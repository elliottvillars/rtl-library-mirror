; SMT-LIBv2 description generated by Yosys 0.9+1706 (git sha1 c9555c9ade, g++ 9.3.0 -fPIC -Os)
; yosys-smt2-module dynamic_clock_divider
(declare-sort |dynamic_clock_divider_s| 0)
(declare-fun |dynamic_clock_divider_is| (|dynamic_clock_divider_s|) Bool)
; yosys-smt2-register r_PAST_VALID 1
; yosys-smt2-wire r_PAST_VALID 1
(declare-fun |dynamic_clock_divider#0| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; \r_PAST_VALID
(define-fun |dynamic_clock_divider_n r_PAST_VALID| ((state |dynamic_clock_divider_s|)) Bool (= ((_ extract 0 0) (|dynamic_clock_divider#0| state)) #b1))
; yosys-smt2-register r_Count 32
; yosys-smt2-wire r_Count 32
(declare-fun |dynamic_clock_divider#1| (|dynamic_clock_divider_s|) (_ BitVec 32)) ; \r_Count
(define-fun |dynamic_clock_divider_n r_Count| ((state |dynamic_clock_divider_s|)) (_ BitVec 32) (|dynamic_clock_divider#1| state))
; yosys-smt2-output o_ENABLE_OUT 1
; yosys-smt2-register o_ENABLE_OUT 1
; yosys-smt2-wire o_ENABLE_OUT 1
(declare-fun |dynamic_clock_divider#2| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; \o_ENABLE_OUT
(define-fun |dynamic_clock_divider_n o_ENABLE_OUT| ((state |dynamic_clock_divider_s|)) Bool (= ((_ extract 0 0) (|dynamic_clock_divider#2| state)) #b1))
; yosys-smt2-input i_RESET 1
; yosys-smt2-wire i_RESET 1
(declare-fun |dynamic_clock_divider#3| (|dynamic_clock_divider_s|) Bool) ; \i_RESET
(define-fun |dynamic_clock_divider_n i_RESET| ((state |dynamic_clock_divider_s|)) Bool (|dynamic_clock_divider#3| state))
; yosys-smt2-input i_ENABLE 1
; yosys-smt2-wire i_ENABLE 1
(declare-fun |dynamic_clock_divider#4| (|dynamic_clock_divider_s|) Bool) ; \i_ENABLE
(define-fun |dynamic_clock_divider_n i_ENABLE| ((state |dynamic_clock_divider_s|)) Bool (|dynamic_clock_divider#4| state))
; yosys-smt2-input i_DIV_VALUE 32
; yosys-smt2-wire i_DIV_VALUE 32
(declare-fun |dynamic_clock_divider#5| (|dynamic_clock_divider_s|) (_ BitVec 32)) ; \i_DIV_VALUE
(define-fun |dynamic_clock_divider_n i_DIV_VALUE| ((state |dynamic_clock_divider_s|)) (_ BitVec 32) (|dynamic_clock_divider#5| state))
; yosys-smt2-input i_CLK 1
; yosys-smt2-wire i_CLK 1
(declare-fun |dynamic_clock_divider#6| (|dynamic_clock_divider_s|) Bool) ; \i_CLK
(define-fun |dynamic_clock_divider_n i_CLK| ((state |dynamic_clock_divider_s|)) Bool (|dynamic_clock_divider#6| state))
; yosys-smt2-register $past$dynamic_clock_divider.v:93$7$0 32
(declare-fun |dynamic_clock_divider#7| (|dynamic_clock_divider_s|) (_ BitVec 32)) ; $past$dynamic_clock_divider.v:93$7$0
(define-fun |dynamic_clock_divider_n $past$dynamic_clock_divider.v:93$7$0| ((state |dynamic_clock_divider_s|)) (_ BitVec 32) (|dynamic_clock_divider#7| state))
; yosys-smt2-register $past$dynamic_clock_divider.v:80$2$0 32
(declare-fun |dynamic_clock_divider#8| (|dynamic_clock_divider_s|) (_ BitVec 32)) ; $past$dynamic_clock_divider.v:80$2$0
(define-fun |dynamic_clock_divider_n $past$dynamic_clock_divider.v:80$2$0| ((state |dynamic_clock_divider_s|)) (_ BitVec 32) (|dynamic_clock_divider#8| state))
; yosys-smt2-register $formal$dynamic_clock_divider.v:95$19_EN 1
(declare-fun |dynamic_clock_divider#9| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $formal$dynamic_clock_divider.v:95$19_EN
(define-fun |dynamic_clock_divider_n $formal$dynamic_clock_divider.v:95$19_EN| ((state |dynamic_clock_divider_s|)) Bool (= ((_ extract 0 0) (|dynamic_clock_divider#9| state)) #b1))
; yosys-smt2-register $formal$dynamic_clock_divider.v:95$19_CHECK 1
(declare-fun |dynamic_clock_divider#10| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $formal$dynamic_clock_divider.v:95$19_CHECK
(define-fun |dynamic_clock_divider_n $formal$dynamic_clock_divider.v:95$19_CHECK| ((state |dynamic_clock_divider_s|)) Bool (= ((_ extract 0 0) (|dynamic_clock_divider#10| state)) #b1))
; yosys-smt2-register $formal$dynamic_clock_divider.v:93$18_EN 1
(declare-fun |dynamic_clock_divider#11| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $formal$dynamic_clock_divider.v:93$18_EN
(define-fun |dynamic_clock_divider_n $formal$dynamic_clock_divider.v:93$18_EN| ((state |dynamic_clock_divider_s|)) Bool (= ((_ extract 0 0) (|dynamic_clock_divider#11| state)) #b1))
; yosys-smt2-register $formal$dynamic_clock_divider.v:93$18_CHECK 1
(declare-fun |dynamic_clock_divider#12| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $formal$dynamic_clock_divider.v:93$18_CHECK
(define-fun |dynamic_clock_divider_n $formal$dynamic_clock_divider.v:93$18_CHECK| ((state |dynamic_clock_divider_s|)) Bool (= ((_ extract 0 0) (|dynamic_clock_divider#12| state)) #b1))
; yosys-smt2-register $formal$dynamic_clock_divider.v:91$17_EN 1
(declare-fun |dynamic_clock_divider#13| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $formal$dynamic_clock_divider.v:91$17_EN
(define-fun |dynamic_clock_divider_n $formal$dynamic_clock_divider.v:91$17_EN| ((state |dynamic_clock_divider_s|)) Bool (= ((_ extract 0 0) (|dynamic_clock_divider#13| state)) #b1))
; yosys-smt2-register $formal$dynamic_clock_divider.v:91$17_CHECK 1
(declare-fun |dynamic_clock_divider#14| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $formal$dynamic_clock_divider.v:91$17_CHECK
(define-fun |dynamic_clock_divider_n $formal$dynamic_clock_divider.v:91$17_CHECK| ((state |dynamic_clock_divider_s|)) Bool (= ((_ extract 0 0) (|dynamic_clock_divider#14| state)) #b1))
; yosys-smt2-register $formal$dynamic_clock_divider.v:86$16_CHECK 1
(declare-fun |dynamic_clock_divider#15| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $formal$dynamic_clock_divider.v:86$16_CHECK
(define-fun |dynamic_clock_divider_n $formal$dynamic_clock_divider.v:86$16_CHECK| ((state |dynamic_clock_divider_s|)) Bool (= ((_ extract 0 0) (|dynamic_clock_divider#15| state)) #b1))
; yosys-smt2-register $formal$dynamic_clock_divider.v:85$15_EN 1
(declare-fun |dynamic_clock_divider#16| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $formal$dynamic_clock_divider.v:85$15_EN
(define-fun |dynamic_clock_divider_n $formal$dynamic_clock_divider.v:85$15_EN| ((state |dynamic_clock_divider_s|)) Bool (= ((_ extract 0 0) (|dynamic_clock_divider#16| state)) #b1))
; yosys-smt2-register $formal$dynamic_clock_divider.v:85$15_CHECK 1
(declare-fun |dynamic_clock_divider#17| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $formal$dynamic_clock_divider.v:85$15_CHECK
(define-fun |dynamic_clock_divider_n $formal$dynamic_clock_divider.v:85$15_CHECK| ((state |dynamic_clock_divider_s|)) Bool (= ((_ extract 0 0) (|dynamic_clock_divider#17| state)) #b1))
; yosys-smt2-register $eq$dynamic_clock_divider.v:84$72_Y 1
(declare-fun |dynamic_clock_divider#18| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $eq$dynamic_clock_divider.v:84$72_Y
(define-fun |dynamic_clock_divider_n $eq$dynamic_clock_divider.v:84$72_Y| ((state |dynamic_clock_divider_s|)) Bool (= ((_ extract 0 0) (|dynamic_clock_divider#18| state)) #b1))
; yosys-smt2-register $eq$dynamic_clock_divider.v:84$71_Y 1
(declare-fun |dynamic_clock_divider#19| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $eq$dynamic_clock_divider.v:84$71_Y
(define-fun |dynamic_clock_divider_n $eq$dynamic_clock_divider.v:84$71_Y| ((state |dynamic_clock_divider_s|)) Bool (= ((_ extract 0 0) (|dynamic_clock_divider#19| state)) #b1))
; yosys-smt2-register $and$dynamic_clock_divider.v:0$66_Y 1
(declare-fun |dynamic_clock_divider#20| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $and$dynamic_clock_divider.v:0$66_Y
(define-fun |dynamic_clock_divider_n $and$dynamic_clock_divider.v:0$66_Y| ((state |dynamic_clock_divider_s|)) Bool (= ((_ extract 0 0) (|dynamic_clock_divider#20| state)) #b1))
(define-fun |dynamic_clock_divider#21| ((state |dynamic_clock_divider_s|)) Bool (= (|dynamic_clock_divider#8| state) (|dynamic_clock_divider#5| state))) ; $0$formal$dynamic_clock_divider.v:79$14_CHECK[0:0]$47
; yosys-smt2-assume 0 dynamic_clock_divider.v:79.27-80.31
(define-fun |dynamic_clock_divider_u 0| ((state |dynamic_clock_divider_s|)) Bool (or (|dynamic_clock_divider#21| state) (not true))) ; $assume$dynamic_clock_divider.v:79$91
(define-fun |dynamic_clock_divider#22| ((state |dynamic_clock_divider_s|)) Bool (distinct (|dynamic_clock_divider#20| state) (ite (|dynamic_clock_divider#6| state) #b1 #b0))) ; $0$formal$dynamic_clock_divider.v:78$13_CHECK[0:0]$45
; yosys-smt2-assume 1 dynamic_clock_divider.v:78.7-79.26
(define-fun |dynamic_clock_divider_u 1| ((state |dynamic_clock_divider_s|)) Bool (or (|dynamic_clock_divider#22| state) (not true))) ; $assume$dynamic_clock_divider.v:78$90
(define-fun |dynamic_clock_divider#23| ((state |dynamic_clock_divider_s|)) Bool (= (|dynamic_clock_divider#19| state) (ite (|dynamic_clock_divider#3| state) #b1 #b0))) ; $eq$dynamic_clock_divider.v:102$89_Y
; yosys-smt2-anyseq dynamic_clock_divider#24 1 $auto$setundef.cc:524:execute$271
(declare-fun |dynamic_clock_divider#24| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2362:Anyseq$272
(define-fun |dynamic_clock_divider#25| ((state |dynamic_clock_divider_s|)) Bool (not (or  (= ((_ extract 0 0) (|dynamic_clock_divider#20| state)) #b1) false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false))) ; $logic_not$dynamic_clock_divider.v:0$67_Y
(define-fun |dynamic_clock_divider#26| ((state |dynamic_clock_divider_s|)) Bool (and (or  (|dynamic_clock_divider#25| state) false) (or  (|dynamic_clock_divider#6| state) false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false))) ; $logic_and$dynamic_clock_divider.v:82$69_Y
(define-fun |dynamic_clock_divider#27| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#26| state) (|dynamic_clock_divider#24| state) (ite (|dynamic_clock_divider#23| state) #b1 #b0))) ; $0$formal$dynamic_clock_divider.v:101$21_CHECK[0:0]$61
(define-fun |dynamic_clock_divider#28| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#26| state) #b0 #b1)) ; $0$formal$dynamic_clock_divider.v:100$20_EN[0:0]$60
; yosys-smt2-assume 2 dynamic_clock_divider.v:101.30-102.28
(define-fun |dynamic_clock_divider_u 2| ((state |dynamic_clock_divider_s|)) Bool (or (= ((_ extract 0 0) (|dynamic_clock_divider#27| state)) #b1) (not (= ((_ extract 0 0) (|dynamic_clock_divider#28| state)) #b1)))) ; $assume$dynamic_clock_divider.v:101$98
(define-fun |dynamic_clock_divider#29| ((state |dynamic_clock_divider_s|)) Bool (= (|dynamic_clock_divider#18| state) (ite (|dynamic_clock_divider#4| state) #b1 #b0))) ; $eq$dynamic_clock_divider.v:101$88_Y
; yosys-smt2-anyseq dynamic_clock_divider#30 1 $auto$setundef.cc:524:execute$269
(declare-fun |dynamic_clock_divider#30| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2362:Anyseq$270
(define-fun |dynamic_clock_divider#31| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#26| state) (|dynamic_clock_divider#30| state) (ite (|dynamic_clock_divider#29| state) #b1 #b0))) ; $0$formal$dynamic_clock_divider.v:100$20_CHECK[0:0]$59
; yosys-smt2-assume 3 dynamic_clock_divider.v:100.8-101.29
(define-fun |dynamic_clock_divider_u 3| ((state |dynamic_clock_divider_s|)) Bool (or (= ((_ extract 0 0) (|dynamic_clock_divider#31| state)) #b1) (not (= ((_ extract 0 0) (|dynamic_clock_divider#28| state)) #b1)))) ; $assume$dynamic_clock_divider.v:100$97
; yosys-smt2-assert 0 dynamic_clock_divider.v:95.9-96.34
(define-fun |dynamic_clock_divider_a 0| ((state |dynamic_clock_divider_s|)) Bool (or (= ((_ extract 0 0) (|dynamic_clock_divider#10| state)) #b1) (not (= ((_ extract 0 0) (|dynamic_clock_divider#9| state)) #b1)))) ; $assert$dynamic_clock_divider.v:95$96
; yosys-smt2-assert 1 dynamic_clock_divider.v:93.69-94.34
(define-fun |dynamic_clock_divider_a 1| ((state |dynamic_clock_divider_s|)) Bool (or (= ((_ extract 0 0) (|dynamic_clock_divider#12| state)) #b1) (not (= ((_ extract 0 0) (|dynamic_clock_divider#11| state)) #b1)))) ; $assert$dynamic_clock_divider.v:93$95
; yosys-smt2-assert 2 dynamic_clock_divider.v:91.29-92.26
(define-fun |dynamic_clock_divider_a 2| ((state |dynamic_clock_divider_s|)) Bool (or (= ((_ extract 0 0) (|dynamic_clock_divider#14| state)) #b1) (not (= ((_ extract 0 0) (|dynamic_clock_divider#13| state)) #b1)))) ; $assert$dynamic_clock_divider.v:91$94
; yosys-smt2-assert 3 dynamic_clock_divider.v:86.26-87.30
(define-fun |dynamic_clock_divider_a 3| ((state |dynamic_clock_divider_s|)) Bool (or (= ((_ extract 0 0) (|dynamic_clock_divider#15| state)) #b1) (not (= ((_ extract 0 0) (|dynamic_clock_divider#16| state)) #b1)))) ; $assert$dynamic_clock_divider.v:86$93
; yosys-smt2-assert 4 dynamic_clock_divider.v:85.9-86.25
(define-fun |dynamic_clock_divider_a 4| ((state |dynamic_clock_divider_s|)) Bool (or (= ((_ extract 0 0) (|dynamic_clock_divider#17| state)) #b1) (not (= ((_ extract 0 0) (|dynamic_clock_divider#16| state)) #b1)))) ; $assert$dynamic_clock_divider.v:85$92
; yosys-smt2-anyseq dynamic_clock_divider#32 1 $auto$setundef.cc:524:execute$245
(declare-fun |dynamic_clock_divider#32| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2362:Anyseq$246
; yosys-smt2-anyseq dynamic_clock_divider#33 1 $auto$setundef.cc:524:execute$243
(declare-fun |dynamic_clock_divider#33| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2362:Anyseq$244
(define-fun |dynamic_clock_divider#34| ((state |dynamic_clock_divider_s|)) Bool (not (or  (= ((_ extract 0 0) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 1 1) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 2 2) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 3 3) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 4 4) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 5 5) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 6 6) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 7 7) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 8 8) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 9 9) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 10 10) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 11 11) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 12 12) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 13 13) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 14 14) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 15 15) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 16 16) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 17 17) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 18 18) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 19 19) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 20 20) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 21 21) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 22 22) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 23 23) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 24 24) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 25 25) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 26 26) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 27 27) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 28 28) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 29 29) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 30 30) (|dynamic_clock_divider#1| state)) #b1) (= ((_ extract 31 31) (|dynamic_clock_divider#1| state)) #b1)))) ; $eq$dynamic_clock_divider.v:86$74_Y
(define-fun |dynamic_clock_divider#35| ((state |dynamic_clock_divider_s|)) Bool (and (or  (= ((_ extract 0 0) (|dynamic_clock_divider#19| state)) #b1) false) (or  (= ((_ extract 0 0) (|dynamic_clock_divider#18| state)) #b1) false))) ; $logic_and$dynamic_clock_divider.v:84$73_Y
(define-fun |dynamic_clock_divider#36| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#35| state) (ite (|dynamic_clock_divider#34| state) #b1 #b0) (|dynamic_clock_divider#33| state))) ; $procmux$125_Y
(define-fun |dynamic_clock_divider#37| ((state |dynamic_clock_divider_s|)) Bool (and (or  (= ((_ extract 0 0) (|dynamic_clock_divider#0| state)) #b1) false) (or  (|dynamic_clock_divider#26| state) false))) ; $logic_and$dynamic_clock_divider.v:82$70_Y
(define-fun |dynamic_clock_divider#38| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#37| state) (|dynamic_clock_divider#36| state) (|dynamic_clock_divider#32| state))) ; $0$formal$dynamic_clock_divider.v:85$15_CHECK[0:0]$49
(define-fun |dynamic_clock_divider#39| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#35| state) #b1 #b0)) ; $procmux$120_Y
(define-fun |dynamic_clock_divider#40| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#37| state) (|dynamic_clock_divider#39| state) #b0)) ; $0$formal$dynamic_clock_divider.v:85$15_EN[0:0]$50
; yosys-smt2-anyseq dynamic_clock_divider#41 1 $auto$setundef.cc:524:execute$249
(declare-fun |dynamic_clock_divider#41| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2362:Anyseq$250
; yosys-smt2-anyseq dynamic_clock_divider#42 1 $auto$setundef.cc:524:execute$247
(declare-fun |dynamic_clock_divider#42| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2362:Anyseq$248
(define-fun |dynamic_clock_divider#43| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (bvnot (|dynamic_clock_divider#2| state))) ; $eq$dynamic_clock_divider.v:87$75_Y
(define-fun |dynamic_clock_divider#44| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#35| state) (|dynamic_clock_divider#43| state) (|dynamic_clock_divider#42| state))) ; $procmux$135_Y
(define-fun |dynamic_clock_divider#45| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#37| state) (|dynamic_clock_divider#44| state) (|dynamic_clock_divider#41| state))) ; $0$formal$dynamic_clock_divider.v:86$16_CHECK[0:0]$51
; yosys-smt2-anyseq dynamic_clock_divider#46 1 $auto$setundef.cc:524:execute$255
(declare-fun |dynamic_clock_divider#46| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2362:Anyseq$256
; yosys-smt2-anyseq dynamic_clock_divider#47 1 $auto$setundef.cc:524:execute$251
(declare-fun |dynamic_clock_divider#47| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2362:Anyseq$252
(define-fun |dynamic_clock_divider#48| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (= ((_ extract 0 0) (|dynamic_clock_divider#18| state)) #b1) (|dynamic_clock_divider#47| state) (ite (|dynamic_clock_divider#34| state) #b1 #b0))) ; $procmux$146_Y
; yosys-smt2-anyseq dynamic_clock_divider#49 1 $auto$setundef.cc:524:execute$253
(declare-fun |dynamic_clock_divider#49| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2362:Anyseq$254
(define-fun |dynamic_clock_divider#50| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#35| state) (|dynamic_clock_divider#49| state) (|dynamic_clock_divider#48| state))) ; $procmux$149_Y
(define-fun |dynamic_clock_divider#51| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#37| state) (|dynamic_clock_divider#50| state) (|dynamic_clock_divider#46| state))) ; $0$formal$dynamic_clock_divider.v:91$17_CHECK[0:0]$53
(define-fun |dynamic_clock_divider#52| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (= ((_ extract 0 0) (|dynamic_clock_divider#18| state)) #b1) #b0 #b1)) ; $procmux$139_Y
(define-fun |dynamic_clock_divider#53| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#35| state) #b0 (|dynamic_clock_divider#52| state))) ; $procmux$142_Y
(define-fun |dynamic_clock_divider#54| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#37| state) (|dynamic_clock_divider#53| state) #b0)) ; $0$formal$dynamic_clock_divider.v:91$17_EN[0:0]$54
; yosys-smt2-anyseq dynamic_clock_divider#55 1 $auto$setundef.cc:524:execute$261
(declare-fun |dynamic_clock_divider#55| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2362:Anyseq$262
; yosys-smt2-anyseq dynamic_clock_divider#56 1 $auto$setundef.cc:524:execute$257
(declare-fun |dynamic_clock_divider#56| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2362:Anyseq$258
(define-fun |dynamic_clock_divider#57| ((state |dynamic_clock_divider_s|)) Bool (= (|dynamic_clock_divider#7| state) (|dynamic_clock_divider#8| state))) ; $eq$dynamic_clock_divider.v:93$78_Y
(define-fun |dynamic_clock_divider#58| ((state |dynamic_clock_divider_s|)) Bool (and (or  (|dynamic_clock_divider#57| state) false) (or  (= ((_ extract 0 0) (|dynamic_clock_divider#18| state)) #b1) false))) ; $logic_and$dynamic_clock_divider.v:93$80_Y
(define-fun |dynamic_clock_divider#59| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#58| state) (|dynamic_clock_divider#2| state) (|dynamic_clock_divider#56| state))) ; $procmux$162_Y
; yosys-smt2-anyseq dynamic_clock_divider#60 1 $auto$setundef.cc:524:execute$259
(declare-fun |dynamic_clock_divider#60| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2362:Anyseq$260
(define-fun |dynamic_clock_divider#61| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#35| state) (|dynamic_clock_divider#60| state) (|dynamic_clock_divider#59| state))) ; $procmux$165_Y
(define-fun |dynamic_clock_divider#62| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#37| state) (|dynamic_clock_divider#61| state) (|dynamic_clock_divider#55| state))) ; $0$formal$dynamic_clock_divider.v:93$18_CHECK[0:0]$55
(define-fun |dynamic_clock_divider#63| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#58| state) #b1 #b0)) ; $procmux$154_Y
(define-fun |dynamic_clock_divider#64| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#35| state) #b0 (|dynamic_clock_divider#63| state))) ; $procmux$157_Y
(define-fun |dynamic_clock_divider#65| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#37| state) (|dynamic_clock_divider#64| state) #b0)) ; $0$formal$dynamic_clock_divider.v:93$18_EN[0:0]$56
; yosys-smt2-anyseq dynamic_clock_divider#66 1 $auto$setundef.cc:524:execute$267
(declare-fun |dynamic_clock_divider#66| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2362:Anyseq$268
; yosys-smt2-anyseq dynamic_clock_divider#67 1 $auto$setundef.cc:524:execute$263
(declare-fun |dynamic_clock_divider#67| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2362:Anyseq$264
(define-fun |dynamic_clock_divider#68| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#58| state) (|dynamic_clock_divider#67| state) (|dynamic_clock_divider#43| state))) ; $procmux$178_Y
; yosys-smt2-anyseq dynamic_clock_divider#69 1 $auto$setundef.cc:524:execute$265
(declare-fun |dynamic_clock_divider#69| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2362:Anyseq$266
(define-fun |dynamic_clock_divider#70| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#35| state) (|dynamic_clock_divider#69| state) (|dynamic_clock_divider#68| state))) ; $procmux$181_Y
(define-fun |dynamic_clock_divider#71| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#37| state) (|dynamic_clock_divider#70| state) (|dynamic_clock_divider#66| state))) ; $0$formal$dynamic_clock_divider.v:95$19_CHECK[0:0]$57
(define-fun |dynamic_clock_divider#72| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#58| state) #b0 #b1)) ; $procmux$170_Y
(define-fun |dynamic_clock_divider#73| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#35| state) #b0 (|dynamic_clock_divider#72| state))) ; $procmux$173_Y
(define-fun |dynamic_clock_divider#74| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#37| state) (|dynamic_clock_divider#73| state) #b0)) ; $0$formal$dynamic_clock_divider.v:95$19_EN[0:0]$58
(define-fun |dynamic_clock_divider#75| ((state |dynamic_clock_divider_s|)) Bool (= (|dynamic_clock_divider#1| state) (|dynamic_clock_divider#5| state))) ; $eq$dynamic_clock_divider.v:43$25_Y
(define-fun |dynamic_clock_divider#76| ((state |dynamic_clock_divider_s|)) Bool (and (or  (|dynamic_clock_divider#75| state) false) (or  (|dynamic_clock_divider#4| state) false))) ; $logic_and$dynamic_clock_divider.v:63$31_Y
(define-fun |dynamic_clock_divider#77| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#76| state) #b1 #b0)) ; $procmux$194_Y
(define-fun |dynamic_clock_divider#78| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#3| state) #b0 (|dynamic_clock_divider#77| state))) ; $0\o_ENABLE_OUT[0:0]
(define-fun |dynamic_clock_divider#79| ((state |dynamic_clock_divider_s|)) (_ BitVec 32) (bvadd (|dynamic_clock_divider#1| state) #b00000000000000000000000000000001)) ; $add$dynamic_clock_divider.v:46$26_Y
(define-fun |dynamic_clock_divider#80| ((state |dynamic_clock_divider_s|)) (_ BitVec 32) (ite (|dynamic_clock_divider#75| state) #b00000000000000000000000000000000 (|dynamic_clock_divider#79| state))) ; $procmux$201_Y
(define-fun |dynamic_clock_divider#81| ((state |dynamic_clock_divider_s|)) (_ BitVec 32) (ite (|dynamic_clock_divider#4| state) (|dynamic_clock_divider#80| state) #b00000000000000000000000000000000)) ; $procmux$203_Y
(define-fun |dynamic_clock_divider#82| ((state |dynamic_clock_divider_s|)) (_ BitVec 32) (ite (|dynamic_clock_divider#3| state) #b00000000000000000000000000000000 (|dynamic_clock_divider#81| state))) ; $0\r_Count[31:0]
(define-fun |dynamic_clock_divider_a| ((state |dynamic_clock_divider_s|)) Bool (and
  (|dynamic_clock_divider_a 0| state)
  (|dynamic_clock_divider_a 1| state)
  (|dynamic_clock_divider_a 2| state)
  (|dynamic_clock_divider_a 3| state)
  (|dynamic_clock_divider_a 4| state)
))
(define-fun |dynamic_clock_divider_u| ((state |dynamic_clock_divider_s|)) Bool (and
  (|dynamic_clock_divider_u 0| state)
  (|dynamic_clock_divider_u 1| state)
  (|dynamic_clock_divider_u 2| state)
  (|dynamic_clock_divider_u 3| state)
))
(define-fun |dynamic_clock_divider_i| ((state |dynamic_clock_divider_s|)) Bool (and
  (= (= ((_ extract 0 0) (|dynamic_clock_divider#0| state)) #b1) false) ; r_PAST_VALID
  (= (|dynamic_clock_divider#1| state) #b00000000000000000000000000000000) ; r_Count
  (= (= ((_ extract 0 0) (|dynamic_clock_divider#9| state)) #b1) false) ; $formal$dynamic_clock_divider.v:95$19_EN
  (= (= ((_ extract 0 0) (|dynamic_clock_divider#11| state)) #b1) false) ; $formal$dynamic_clock_divider.v:93$18_EN
  (= (= ((_ extract 0 0) (|dynamic_clock_divider#13| state)) #b1) false) ; $formal$dynamic_clock_divider.v:91$17_EN
  (= (= ((_ extract 0 0) (|dynamic_clock_divider#16| state)) #b1) false) ; $formal$dynamic_clock_divider.v:85$15_EN
))
(define-fun |dynamic_clock_divider_h| ((state |dynamic_clock_divider_s|)) Bool true)
(define-fun |dynamic_clock_divider_t| ((state |dynamic_clock_divider_s|) (next_state |dynamic_clock_divider_s|)) Bool (and
  (= (ite (|dynamic_clock_divider#6| state) #b1 #b0) (|dynamic_clock_divider#20| next_state)) ; $procdff$209 $and$dynamic_clock_divider.v:0$66_Y
  (= (ite (|dynamic_clock_divider#3| state) #b1 #b0) (|dynamic_clock_divider#19| next_state)) ; $procdff$212 $eq$dynamic_clock_divider.v:84$71_Y
  (= (ite (|dynamic_clock_divider#4| state) #b1 #b0) (|dynamic_clock_divider#18| next_state)) ; $procdff$213 $eq$dynamic_clock_divider.v:84$72_Y
  (= (|dynamic_clock_divider#38| state) (|dynamic_clock_divider#17| next_state)) ; $procdff$225 $formal$dynamic_clock_divider.v:85$15_CHECK
  (= (|dynamic_clock_divider#40| state) (|dynamic_clock_divider#16| next_state)) ; $procdff$226 $formal$dynamic_clock_divider.v:85$15_EN
  (= (|dynamic_clock_divider#45| state) (|dynamic_clock_divider#15| next_state)) ; $procdff$227 $formal$dynamic_clock_divider.v:86$16_CHECK
  (= (|dynamic_clock_divider#51| state) (|dynamic_clock_divider#14| next_state)) ; $procdff$229 $formal$dynamic_clock_divider.v:91$17_CHECK
  (= (|dynamic_clock_divider#54| state) (|dynamic_clock_divider#13| next_state)) ; $procdff$230 $formal$dynamic_clock_divider.v:91$17_EN
  (= (|dynamic_clock_divider#62| state) (|dynamic_clock_divider#12| next_state)) ; $procdff$231 $formal$dynamic_clock_divider.v:93$18_CHECK
  (= (|dynamic_clock_divider#65| state) (|dynamic_clock_divider#11| next_state)) ; $procdff$232 $formal$dynamic_clock_divider.v:93$18_EN
  (= (|dynamic_clock_divider#71| state) (|dynamic_clock_divider#10| next_state)) ; $procdff$233 $formal$dynamic_clock_divider.v:95$19_CHECK
  (= (|dynamic_clock_divider#74| state) (|dynamic_clock_divider#9| next_state)) ; $procdff$234 $formal$dynamic_clock_divider.v:95$19_EN
  (= (|dynamic_clock_divider#5| state) (|dynamic_clock_divider#8| next_state)) ; $procdff$210 $past$dynamic_clock_divider.v:80$2$0
  (= (|dynamic_clock_divider#1| state) (|dynamic_clock_divider#7| next_state)) ; $procdff$215 $past$dynamic_clock_divider.v:93$7$0
  (= (|dynamic_clock_divider#78| state) (|dynamic_clock_divider#2| next_state)) ; $procdff$239 \o_ENABLE_OUT
  (= (|dynamic_clock_divider#82| state) (|dynamic_clock_divider#1| next_state)) ; $procdff$240 \r_Count
  (= #b1 (|dynamic_clock_divider#0| next_state)) ; $procdff$208 \r_PAST_VALID
)) ; end of module dynamic_clock_divider
; yosys-smt2-topmod dynamic_clock_divider
; end of yosys output
