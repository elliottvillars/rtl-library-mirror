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
; yosys-smt2-register $past$dynamic_clock_divider.v:92$7$0 32
(declare-fun |dynamic_clock_divider#7| (|dynamic_clock_divider_s|) (_ BitVec 32)) ; $past$dynamic_clock_divider.v:92$7$0
(define-fun |dynamic_clock_divider_n $past$dynamic_clock_divider.v:92$7$0| ((state |dynamic_clock_divider_s|)) (_ BitVec 32) (|dynamic_clock_divider#7| state))
; yosys-smt2-register $past$dynamic_clock_divider.v:79$2$0 32
(declare-fun |dynamic_clock_divider#8| (|dynamic_clock_divider_s|) (_ BitVec 32)) ; $past$dynamic_clock_divider.v:79$2$0
(define-fun |dynamic_clock_divider_n $past$dynamic_clock_divider.v:79$2$0| ((state |dynamic_clock_divider_s|)) (_ BitVec 32) (|dynamic_clock_divider#8| state))
; yosys-smt2-register $formal$dynamic_clock_divider.v:94$16_EN 1
(declare-fun |dynamic_clock_divider#9| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $formal$dynamic_clock_divider.v:94$16_EN
(define-fun |dynamic_clock_divider_n $formal$dynamic_clock_divider.v:94$16_EN| ((state |dynamic_clock_divider_s|)) Bool (= ((_ extract 0 0) (|dynamic_clock_divider#9| state)) #b1))
; yosys-smt2-register $formal$dynamic_clock_divider.v:94$16_CHECK 1
(declare-fun |dynamic_clock_divider#10| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $formal$dynamic_clock_divider.v:94$16_CHECK
(define-fun |dynamic_clock_divider_n $formal$dynamic_clock_divider.v:94$16_CHECK| ((state |dynamic_clock_divider_s|)) Bool (= ((_ extract 0 0) (|dynamic_clock_divider#10| state)) #b1))
; yosys-smt2-register $formal$dynamic_clock_divider.v:92$15_EN 1
(declare-fun |dynamic_clock_divider#11| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $formal$dynamic_clock_divider.v:92$15_EN
(define-fun |dynamic_clock_divider_n $formal$dynamic_clock_divider.v:92$15_EN| ((state |dynamic_clock_divider_s|)) Bool (= ((_ extract 0 0) (|dynamic_clock_divider#11| state)) #b1))
; yosys-smt2-register $formal$dynamic_clock_divider.v:92$15_CHECK 1
(declare-fun |dynamic_clock_divider#12| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $formal$dynamic_clock_divider.v:92$15_CHECK
(define-fun |dynamic_clock_divider_n $formal$dynamic_clock_divider.v:92$15_CHECK| ((state |dynamic_clock_divider_s|)) Bool (= ((_ extract 0 0) (|dynamic_clock_divider#12| state)) #b1))
; yosys-smt2-register $eq$dynamic_clock_divider.v:83$63_Y 1
(declare-fun |dynamic_clock_divider#13| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $eq$dynamic_clock_divider.v:83$63_Y
(define-fun |dynamic_clock_divider_n $eq$dynamic_clock_divider.v:83$63_Y| ((state |dynamic_clock_divider_s|)) Bool (= ((_ extract 0 0) (|dynamic_clock_divider#13| state)) #b1))
; yosys-smt2-register $eq$dynamic_clock_divider.v:83$62_Y 1
(declare-fun |dynamic_clock_divider#14| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $eq$dynamic_clock_divider.v:83$62_Y
(define-fun |dynamic_clock_divider_n $eq$dynamic_clock_divider.v:83$62_Y| ((state |dynamic_clock_divider_s|)) Bool (= ((_ extract 0 0) (|dynamic_clock_divider#14| state)) #b1))
; yosys-smt2-register $and$dynamic_clock_divider.v:0$57_Y 1
(declare-fun |dynamic_clock_divider#15| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $and$dynamic_clock_divider.v:0$57_Y
(define-fun |dynamic_clock_divider_n $and$dynamic_clock_divider.v:0$57_Y| ((state |dynamic_clock_divider_s|)) Bool (= ((_ extract 0 0) (|dynamic_clock_divider#15| state)) #b1))
(define-fun |dynamic_clock_divider#16| ((state |dynamic_clock_divider_s|)) Bool (= (|dynamic_clock_divider#13| state) (ite (|dynamic_clock_divider#4| state) #b1 #b0))) ; $eq$dynamic_clock_divider.v:100$76_Y
; yosys-smt2-anyseq dynamic_clock_divider#17 1 $auto$setundef.cc:524:execute$205
(declare-fun |dynamic_clock_divider#17| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2362:Anyseq$206
(define-fun |dynamic_clock_divider#18| ((state |dynamic_clock_divider_s|)) Bool (not (or  (= ((_ extract 0 0) (|dynamic_clock_divider#15| state)) #b1) false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false))) ; $logic_not$dynamic_clock_divider.v:0$58_Y
(define-fun |dynamic_clock_divider#19| ((state |dynamic_clock_divider_s|)) Bool (and (or  (|dynamic_clock_divider#18| state) false) (or  (|dynamic_clock_divider#6| state) false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false false))) ; $logic_and$dynamic_clock_divider.v:81$60_Y
(define-fun |dynamic_clock_divider#20| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#19| state) (|dynamic_clock_divider#17| state) (ite (|dynamic_clock_divider#16| state) #b1 #b0))) ; $0$formal$dynamic_clock_divider.v:99$17_CHECK[0:0]$50
(define-fun |dynamic_clock_divider#21| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#19| state) #b0 #b1)) ; $0$formal$dynamic_clock_divider.v:100$18_EN[0:0]$53
; yosys-smt2-assume 0 dynamic_clock_divider.v:99.8-100.29
(define-fun |dynamic_clock_divider_u 0| ((state |dynamic_clock_divider_s|)) Bool (or (= ((_ extract 0 0) (|dynamic_clock_divider#20| state)) #b1) (not (= ((_ extract 0 0) (|dynamic_clock_divider#21| state)) #b1)))) ; $assume$dynamic_clock_divider.v:99$82
(define-fun |dynamic_clock_divider#22| ((state |dynamic_clock_divider_s|)) Bool (= (|dynamic_clock_divider#8| state) (|dynamic_clock_divider#5| state))) ; $0$formal$dynamic_clock_divider.v:78$14_CHECK[0:0]$44
; yosys-smt2-assume 1 dynamic_clock_divider.v:78.27-79.31
(define-fun |dynamic_clock_divider_u 1| ((state |dynamic_clock_divider_s|)) Bool (or (|dynamic_clock_divider#22| state) (not true))) ; $assume$dynamic_clock_divider.v:78$79
(define-fun |dynamic_clock_divider#23| ((state |dynamic_clock_divider_s|)) Bool (distinct (|dynamic_clock_divider#15| state) (ite (|dynamic_clock_divider#6| state) #b1 #b0))) ; $0$formal$dynamic_clock_divider.v:77$13_CHECK[0:0]$42
; yosys-smt2-assume 2 dynamic_clock_divider.v:77.7-78.26
(define-fun |dynamic_clock_divider_u 2| ((state |dynamic_clock_divider_s|)) Bool (or (|dynamic_clock_divider#23| state) (not true))) ; $assume$dynamic_clock_divider.v:77$78
(define-fun |dynamic_clock_divider#24| ((state |dynamic_clock_divider_s|)) Bool (= (|dynamic_clock_divider#14| state) (ite (|dynamic_clock_divider#3| state) #b1 #b0))) ; $eq$dynamic_clock_divider.v:101$77_Y
; yosys-smt2-anyseq dynamic_clock_divider#25 1 $auto$setundef.cc:524:execute$207
(declare-fun |dynamic_clock_divider#25| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2362:Anyseq$208
(define-fun |dynamic_clock_divider#26| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#19| state) (|dynamic_clock_divider#25| state) (ite (|dynamic_clock_divider#24| state) #b1 #b0))) ; $0$formal$dynamic_clock_divider.v:100$18_CHECK[0:0]$52
; yosys-smt2-assume 3 dynamic_clock_divider.v:100.30-101.28
(define-fun |dynamic_clock_divider_u 3| ((state |dynamic_clock_divider_s|)) Bool (or (= ((_ extract 0 0) (|dynamic_clock_divider#26| state)) #b1) (not (= ((_ extract 0 0) (|dynamic_clock_divider#21| state)) #b1)))) ; $assume$dynamic_clock_divider.v:100$83
; yosys-smt2-assert 0 dynamic_clock_divider.v:94.9-95.34
(define-fun |dynamic_clock_divider_a 0| ((state |dynamic_clock_divider_s|)) Bool (or (= ((_ extract 0 0) (|dynamic_clock_divider#10| state)) #b1) (not (= ((_ extract 0 0) (|dynamic_clock_divider#9| state)) #b1)))) ; $assert$dynamic_clock_divider.v:94$81
; yosys-smt2-assert 1 dynamic_clock_divider.v:92.69-93.34
(define-fun |dynamic_clock_divider_a 1| ((state |dynamic_clock_divider_s|)) Bool (or (= ((_ extract 0 0) (|dynamic_clock_divider#12| state)) #b1) (not (= ((_ extract 0 0) (|dynamic_clock_divider#11| state)) #b1)))) ; $assert$dynamic_clock_divider.v:92$80
; yosys-smt2-anyseq dynamic_clock_divider#27 1 $auto$setundef.cc:524:execute$195
(declare-fun |dynamic_clock_divider#27| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2362:Anyseq$196
; yosys-smt2-anyseq dynamic_clock_divider#28 1 $auto$setundef.cc:524:execute$189
(declare-fun |dynamic_clock_divider#28| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2362:Anyseq$190
(define-fun |dynamic_clock_divider#29| ((state |dynamic_clock_divider_s|)) Bool (= (|dynamic_clock_divider#7| state) (|dynamic_clock_divider#8| state))) ; $eq$dynamic_clock_divider.v:92$66_Y
(define-fun |dynamic_clock_divider#30| ((state |dynamic_clock_divider_s|)) Bool (and (or  (|dynamic_clock_divider#29| state) false) (or  (= ((_ extract 0 0) (|dynamic_clock_divider#13| state)) #b1) false))) ; $logic_and$dynamic_clock_divider.v:92$68_Y
(define-fun |dynamic_clock_divider#31| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#30| state) (|dynamic_clock_divider#2| state) (|dynamic_clock_divider#28| state))) ; $procmux$108_Y
; yosys-smt2-anyseq dynamic_clock_divider#32 1 $auto$setundef.cc:524:execute$191
(declare-fun |dynamic_clock_divider#32| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2362:Anyseq$192
(define-fun |dynamic_clock_divider#33| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (= ((_ extract 0 0) (|dynamic_clock_divider#13| state)) #b1) (|dynamic_clock_divider#32| state) (|dynamic_clock_divider#31| state))) ; $procmux$110_Y
; yosys-smt2-anyseq dynamic_clock_divider#34 1 $auto$setundef.cc:524:execute$193
(declare-fun |dynamic_clock_divider#34| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2362:Anyseq$194
(define-fun |dynamic_clock_divider#35| ((state |dynamic_clock_divider_s|)) Bool (and (or  (= ((_ extract 0 0) (|dynamic_clock_divider#14| state)) #b1) false) (or  (= ((_ extract 0 0) (|dynamic_clock_divider#13| state)) #b1) false))) ; $logic_and$dynamic_clock_divider.v:83$64_Y
(define-fun |dynamic_clock_divider#36| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#35| state) (|dynamic_clock_divider#34| state) (|dynamic_clock_divider#33| state))) ; $procmux$113_Y
(define-fun |dynamic_clock_divider#37| ((state |dynamic_clock_divider_s|)) Bool (and (or  (= ((_ extract 0 0) (|dynamic_clock_divider#0| state)) #b1) false) (or  (|dynamic_clock_divider#19| state) false))) ; $logic_and$dynamic_clock_divider.v:81$61_Y
(define-fun |dynamic_clock_divider#38| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#37| state) (|dynamic_clock_divider#36| state) (|dynamic_clock_divider#27| state))) ; $0$formal$dynamic_clock_divider.v:92$15_CHECK[0:0]$46
(define-fun |dynamic_clock_divider#39| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#30| state) #b1 #b0)) ; $procmux$98_Y
(define-fun |dynamic_clock_divider#40| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (= ((_ extract 0 0) (|dynamic_clock_divider#13| state)) #b1) #b0 (|dynamic_clock_divider#39| state))) ; $procmux$100_Y
(define-fun |dynamic_clock_divider#41| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#35| state) #b0 (|dynamic_clock_divider#40| state))) ; $procmux$103_Y
(define-fun |dynamic_clock_divider#42| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#37| state) (|dynamic_clock_divider#41| state) #b0)) ; $0$formal$dynamic_clock_divider.v:92$15_EN[0:0]$47
; yosys-smt2-anyseq dynamic_clock_divider#43 1 $auto$setundef.cc:524:execute$203
(declare-fun |dynamic_clock_divider#43| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2362:Anyseq$204
; yosys-smt2-anyseq dynamic_clock_divider#44 1 $auto$setundef.cc:524:execute$197
(declare-fun |dynamic_clock_divider#44| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2362:Anyseq$198
(define-fun |dynamic_clock_divider#45| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#30| state) (|dynamic_clock_divider#44| state) (|dynamic_clock_divider#2| state))) ; $procmux$128_Y
; yosys-smt2-anyseq dynamic_clock_divider#46 1 $auto$setundef.cc:524:execute$199
(declare-fun |dynamic_clock_divider#46| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2362:Anyseq$200
(define-fun |dynamic_clock_divider#47| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (= ((_ extract 0 0) (|dynamic_clock_divider#13| state)) #b1) (|dynamic_clock_divider#46| state) (|dynamic_clock_divider#45| state))) ; $procmux$130_Y
; yosys-smt2-anyseq dynamic_clock_divider#48 1 $auto$setundef.cc:524:execute$201
(declare-fun |dynamic_clock_divider#48| (|dynamic_clock_divider_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2362:Anyseq$202
(define-fun |dynamic_clock_divider#49| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#35| state) (|dynamic_clock_divider#48| state) (|dynamic_clock_divider#47| state))) ; $procmux$133_Y
(define-fun |dynamic_clock_divider#50| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#37| state) (|dynamic_clock_divider#49| state) (|dynamic_clock_divider#43| state))) ; $0$formal$dynamic_clock_divider.v:94$16_CHECK[0:0]$48
(define-fun |dynamic_clock_divider#51| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#30| state) #b0 #b1)) ; $procmux$118_Y
(define-fun |dynamic_clock_divider#52| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (= ((_ extract 0 0) (|dynamic_clock_divider#13| state)) #b1) #b0 (|dynamic_clock_divider#51| state))) ; $procmux$120_Y
(define-fun |dynamic_clock_divider#53| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#35| state) #b0 (|dynamic_clock_divider#52| state))) ; $procmux$123_Y
(define-fun |dynamic_clock_divider#54| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#37| state) (|dynamic_clock_divider#53| state) #b0)) ; $0$formal$dynamic_clock_divider.v:94$16_EN[0:0]$49
(define-fun |dynamic_clock_divider#55| ((state |dynamic_clock_divider_s|)) Bool (= (|dynamic_clock_divider#1| state) (|dynamic_clock_divider#5| state))) ; $eq$dynamic_clock_divider.v:43$22_Y
(define-fun |dynamic_clock_divider#56| ((state |dynamic_clock_divider_s|)) Bool (and (or  (|dynamic_clock_divider#55| state) false) (or  (|dynamic_clock_divider#4| state) false))) ; $logic_and$dynamic_clock_divider.v:63$28_Y
(define-fun |dynamic_clock_divider#57| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#56| state) #b1 #b0)) ; $procmux$146_Y
(define-fun |dynamic_clock_divider#58| ((state |dynamic_clock_divider_s|)) (_ BitVec 1) (ite (|dynamic_clock_divider#3| state) #b0 (|dynamic_clock_divider#57| state))) ; $0\o_ENABLE_OUT[0:0]
(define-fun |dynamic_clock_divider#59| ((state |dynamic_clock_divider_s|)) (_ BitVec 32) (bvadd (|dynamic_clock_divider#1| state) #b00000000000000000000000000000001)) ; $add$dynamic_clock_divider.v:46$23_Y
(define-fun |dynamic_clock_divider#60| ((state |dynamic_clock_divider_s|)) (_ BitVec 32) (ite (|dynamic_clock_divider#55| state) #b00000000000000000000000000000000 (|dynamic_clock_divider#59| state))) ; $procmux$153_Y
(define-fun |dynamic_clock_divider#61| ((state |dynamic_clock_divider_s|)) (_ BitVec 32) (ite (|dynamic_clock_divider#4| state) (|dynamic_clock_divider#60| state) #b00000000000000000000000000000000)) ; $procmux$155_Y
(define-fun |dynamic_clock_divider#62| ((state |dynamic_clock_divider_s|)) (_ BitVec 32) (ite (|dynamic_clock_divider#3| state) #b00000000000000000000000000000000 (|dynamic_clock_divider#61| state))) ; $0\r_Count[31:0]
(define-fun |dynamic_clock_divider_a| ((state |dynamic_clock_divider_s|)) Bool (and
  (|dynamic_clock_divider_a 0| state)
  (|dynamic_clock_divider_a 1| state)
))
(define-fun |dynamic_clock_divider_u| ((state |dynamic_clock_divider_s|)) Bool (and
  (|dynamic_clock_divider_u 0| state)
  (|dynamic_clock_divider_u 1| state)
  (|dynamic_clock_divider_u 2| state)
  (|dynamic_clock_divider_u 3| state)
))
(define-fun |dynamic_clock_divider_i| ((state |dynamic_clock_divider_s|)) Bool (and
  (= (|dynamic_clock_divider#1| state) #b00000000000000000000000000000000) ; r_Count
  (= (= ((_ extract 0 0) (|dynamic_clock_divider#9| state)) #b1) false) ; $formal$dynamic_clock_divider.v:94$16_EN
  (= (= ((_ extract 0 0) (|dynamic_clock_divider#11| state)) #b1) false) ; $formal$dynamic_clock_divider.v:92$15_EN
))
(define-fun |dynamic_clock_divider_h| ((state |dynamic_clock_divider_s|)) Bool true)
(define-fun |dynamic_clock_divider_t| ((state |dynamic_clock_divider_s|) (next_state |dynamic_clock_divider_s|)) Bool (and
  (= (ite (|dynamic_clock_divider#6| state) #b1 #b0) (|dynamic_clock_divider#15| next_state)) ; $procdff$161 $and$dynamic_clock_divider.v:0$57_Y
  (= (ite (|dynamic_clock_divider#3| state) #b1 #b0) (|dynamic_clock_divider#14| next_state)) ; $procdff$164 $eq$dynamic_clock_divider.v:83$62_Y
  (= (ite (|dynamic_clock_divider#4| state) #b1 #b0) (|dynamic_clock_divider#13| next_state)) ; $procdff$165 $eq$dynamic_clock_divider.v:83$63_Y
  (= (|dynamic_clock_divider#38| state) (|dynamic_clock_divider#12| next_state)) ; $procdff$177 $formal$dynamic_clock_divider.v:92$15_CHECK
  (= (|dynamic_clock_divider#42| state) (|dynamic_clock_divider#11| next_state)) ; $procdff$178 $formal$dynamic_clock_divider.v:92$15_EN
  (= (|dynamic_clock_divider#50| state) (|dynamic_clock_divider#10| next_state)) ; $procdff$179 $formal$dynamic_clock_divider.v:94$16_CHECK
  (= (|dynamic_clock_divider#54| state) (|dynamic_clock_divider#9| next_state)) ; $procdff$180 $formal$dynamic_clock_divider.v:94$16_EN
  (= (|dynamic_clock_divider#5| state) (|dynamic_clock_divider#8| next_state)) ; $procdff$162 $past$dynamic_clock_divider.v:79$2$0
  (= (|dynamic_clock_divider#1| state) (|dynamic_clock_divider#7| next_state)) ; $procdff$167 $past$dynamic_clock_divider.v:92$7$0
  (= (|dynamic_clock_divider#58| state) (|dynamic_clock_divider#2| next_state)) ; $procdff$185 \o_ENABLE_OUT
  (= (|dynamic_clock_divider#62| state) (|dynamic_clock_divider#1| next_state)) ; $procdff$186 \r_Count
  (= #b1 (|dynamic_clock_divider#0| next_state)) ; $procdff$160 \r_PAST_VALID
)) ; end of module dynamic_clock_divider
; yosys-smt2-topmod dynamic_clock_divider
; end of yosys output
