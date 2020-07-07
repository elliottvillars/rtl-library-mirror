; SMT-LIBv2 description generated by Yosys 0.9+2406 (git sha1 a1785e988b, g++ 9.3.0 -fPIC -Os)
; yosys-smt2-module full_adder
(declare-sort |full_adder_s| 0)
(declare-fun |full_adder_is| (|full_adder_s|) Bool)
; yosys-smt2-output o_S 1
; yosys-smt2-wire o_S 1
(declare-fun |full_adder#0| (|full_adder_s|) (_ BitVec 1)) ; \i_A
(declare-fun |full_adder#1| (|full_adder_s|) (_ BitVec 1)) ; \i_B
(define-fun |full_adder#2| ((state |full_adder_s|)) (_ BitVec 1) (bvxor (|full_adder#0| state) (|full_adder#1| state))) ; $xor$./full_adder.v:11$6_Y
(declare-fun |full_adder#3| (|full_adder_s|) (_ BitVec 1)) ; \i_Cin
(define-fun |full_adder#4| ((state |full_adder_s|)) (_ BitVec 1) (bvxor (|full_adder#2| state) (|full_adder#3| state))) ; \o_S
(define-fun |full_adder_n o_S| ((state |full_adder_s|)) Bool (= ((_ extract 0 0) (|full_adder#4| state)) #b1))
; yosys-smt2-output o_Cout 1
; yosys-smt2-wire o_Cout 1
(define-fun |full_adder#5| ((state |full_adder_s|)) (_ BitVec 1) (bvand (|full_adder#0| state) (|full_adder#1| state))) ; $and$./full_adder.v:12$8_Y
(define-fun |full_adder#6| ((state |full_adder_s|)) (_ BitVec 1) (bvand (|full_adder#2| state) (|full_adder#3| state))) ; $and$./full_adder.v:12$10_Y
(define-fun |full_adder#7| ((state |full_adder_s|)) (_ BitVec 1) (bvor (|full_adder#5| state) (|full_adder#6| state))) ; \o_Cout
(define-fun |full_adder_n o_Cout| ((state |full_adder_s|)) Bool (= ((_ extract 0 0) (|full_adder#7| state)) #b1))
; yosys-smt2-input i_Cin 1
; yosys-smt2-wire i_Cin 1
(define-fun |full_adder_n i_Cin| ((state |full_adder_s|)) Bool (= ((_ extract 0 0) (|full_adder#3| state)) #b1))
; yosys-smt2-input i_B 1
; yosys-smt2-wire i_B 1
(define-fun |full_adder_n i_B| ((state |full_adder_s|)) Bool (= ((_ extract 0 0) (|full_adder#1| state)) #b1))
; yosys-smt2-input i_A 1
; yosys-smt2-wire i_A 1
(define-fun |full_adder_n i_A| ((state |full_adder_s|)) Bool (= ((_ extract 0 0) (|full_adder#0| state)) #b1))
; yosys-smt2-wire fw_incat 3
(define-fun |full_adder_n fw_incat| ((state |full_adder_s|)) (_ BitVec 3) (concat (|full_adder#0| state) (concat (|full_adder#1| state) (|full_adder#3| state))))
(define-fun |full_adder#8| ((state |full_adder_s|)) (_ BitVec 1) (bvnot (|full_adder#7| state))) ; $not$./full_adder.v:28$36_Y
; yosys-smt2-anyseq full_adder#9 1 $auto$setundef.cc:501:execute$71
(declare-fun |full_adder#9| (|full_adder_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2437:Anyseq$72
(define-fun |full_adder#10| ((state |full_adder_s|)) Bool (= (concat (|full_adder#0| state) (concat (|full_adder#1| state) (|full_adder#3| state))) #b110)) ; $eq$./full_adder.v:25$29_Y
(define-fun |full_adder#11| ((state |full_adder_s|)) Bool (= (concat (|full_adder#0| state) (concat (|full_adder#1| state) (|full_adder#3| state))) #b101)) ; $eq$./full_adder.v:25$30_Y
(define-fun |full_adder#12| ((state |full_adder_s|)) Bool (or  (|full_adder#10| state) false  (|full_adder#11| state) false)) ; $logic_or$./full_adder.v:25$31_Y
(define-fun |full_adder#13| ((state |full_adder_s|)) Bool (= (concat (|full_adder#0| state) (concat (|full_adder#1| state) (|full_adder#3| state))) #b011)) ; $eq$./full_adder.v:25$32_Y
(define-fun |full_adder#14| ((state |full_adder_s|)) Bool (or  (|full_adder#12| state) false  (|full_adder#13| state) false)) ; $logic_or$./full_adder.v:25$33_Y
(define-fun |full_adder#15| ((state |full_adder_s|)) Bool (= (concat (|full_adder#0| state) (concat (|full_adder#1| state) (|full_adder#3| state))) #b111)) ; $eq$./full_adder.v:21$26_Y
(define-fun |full_adder#16| ((state |full_adder_s|)) Bool (or  (|full_adder#14| state) false  (|full_adder#15| state) false)) ; $logic_or$./full_adder.v:25$35_Y
(define-fun |full_adder#17| ((state |full_adder_s|)) (_ BitVec 1) (ite (|full_adder#16| state) (|full_adder#9| state) (|full_adder#8| state))) ; $0$formal$./full_adder.v:27$4_CHECK[0:0]$19
(define-fun |full_adder#18| ((state |full_adder_s|)) (_ BitVec 1) (ite (|full_adder#16| state) #b0 #b1)) ; $0$formal$./full_adder.v:27$4_EN[0:0]$20
; yosys-smt2-assert 0 ./full_adder.v:27.7-28.19
(define-fun |full_adder_a 0| ((state |full_adder_s|)) Bool (or (= ((_ extract 0 0) (|full_adder#17| state)) #b1) (not (= ((_ extract 0 0) (|full_adder#18| state)) #b1)))) ; $assert$./full_adder.v:27$40
; yosys-smt2-anyseq full_adder#19 1 $auto$setundef.cc:501:execute$69
(declare-fun |full_adder#19| (|full_adder_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2437:Anyseq$70
(define-fun |full_adder#20| ((state |full_adder_s|)) (_ BitVec 1) (ite (|full_adder#16| state) (|full_adder#7| state) (|full_adder#19| state))) ; $0$formal$./full_adder.v:25$3_CHECK[0:0]$17
(define-fun |full_adder#21| ((state |full_adder_s|)) (_ BitVec 1) (ite (|full_adder#16| state) #b1 #b0)) ; $0$formal$./full_adder.v:25$3_EN[0:0]$18
; yosys-smt2-assert 1 ./full_adder.v:25.71-26.18
(define-fun |full_adder_a 1| ((state |full_adder_s|)) Bool (or (= ((_ extract 0 0) (|full_adder#20| state)) #b1) (not (= ((_ extract 0 0) (|full_adder#21| state)) #b1)))) ; $assert$./full_adder.v:25$39
(define-fun |full_adder#22| ((state |full_adder_s|)) (_ BitVec 1) (bvnot (|full_adder#4| state))) ; $not$./full_adder.v:24$28_Y
; yosys-smt2-anyseq full_adder#23 1 $auto$setundef.cc:501:execute$67
(declare-fun |full_adder#23| (|full_adder_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2437:Anyseq$68
(define-fun |full_adder#24| ((state |full_adder_s|)) Bool (= (concat (|full_adder#0| state) (concat (|full_adder#1| state) (|full_adder#3| state))) #b001)) ; $eq$./full_adder.v:21$21_Y
(define-fun |full_adder#25| ((state |full_adder_s|)) Bool (= (concat (|full_adder#0| state) (concat (|full_adder#1| state) (|full_adder#3| state))) #b010)) ; $eq$./full_adder.v:21$22_Y
(define-fun |full_adder#26| ((state |full_adder_s|)) Bool (or  (|full_adder#24| state) false  (|full_adder#25| state) false)) ; $logic_or$./full_adder.v:21$23_Y
(define-fun |full_adder#27| ((state |full_adder_s|)) Bool (= (concat (|full_adder#0| state) (concat (|full_adder#1| state) (|full_adder#3| state))) #b100)) ; $eq$./full_adder.v:21$24_Y
(define-fun |full_adder#28| ((state |full_adder_s|)) Bool (or  (|full_adder#26| state) false  (|full_adder#27| state) false)) ; $logic_or$./full_adder.v:21$25_Y
(define-fun |full_adder#29| ((state |full_adder_s|)) Bool (or  (|full_adder#28| state) false  (|full_adder#15| state) false)) ; $logic_or$./full_adder.v:21$27_Y
(define-fun |full_adder#30| ((state |full_adder_s|)) (_ BitVec 1) (ite (|full_adder#29| state) (|full_adder#23| state) (|full_adder#22| state))) ; $0$formal$./full_adder.v:23$2_CHECK[0:0]$15
(define-fun |full_adder#31| ((state |full_adder_s|)) (_ BitVec 1) (ite (|full_adder#29| state) #b0 #b1)) ; $0$formal$./full_adder.v:23$2_EN[0:0]$16
; yosys-smt2-assert 2 ./full_adder.v:23.7-24.16
(define-fun |full_adder_a 2| ((state |full_adder_s|)) Bool (or (= ((_ extract 0 0) (|full_adder#30| state)) #b1) (not (= ((_ extract 0 0) (|full_adder#31| state)) #b1)))) ; $assert$./full_adder.v:23$38
; yosys-smt2-anyseq full_adder#32 1 $auto$setundef.cc:501:execute$65
(declare-fun |full_adder#32| (|full_adder_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2437:Anyseq$66
(define-fun |full_adder#33| ((state |full_adder_s|)) (_ BitVec 1) (ite (|full_adder#29| state) (|full_adder#4| state) (|full_adder#32| state))) ; $0$formal$./full_adder.v:21$1_CHECK[0:0]$13
(define-fun |full_adder#34| ((state |full_adder_s|)) (_ BitVec 1) (ite (|full_adder#29| state) #b1 #b0)) ; $0$formal$./full_adder.v:21$1_EN[0:0]$14
; yosys-smt2-assert 3 ./full_adder.v:21.71-22.15
(define-fun |full_adder_a 3| ((state |full_adder_s|)) Bool (or (= ((_ extract 0 0) (|full_adder#33| state)) #b1) (not (= ((_ extract 0 0) (|full_adder#34| state)) #b1)))) ; $assert$./full_adder.v:21$37
(define-fun |full_adder_a| ((state |full_adder_s|)) Bool (and
  (|full_adder_a 0| state)
  (|full_adder_a 1| state)
  (|full_adder_a 2| state)
  (|full_adder_a 3| state)
))
(define-fun |full_adder_u| ((state |full_adder_s|)) Bool true)
(define-fun |full_adder_i| ((state |full_adder_s|)) Bool true)
(define-fun |full_adder_h| ((state |full_adder_s|)) Bool true)
(define-fun |full_adder_t| ((state |full_adder_s|) (next_state |full_adder_s|)) Bool true) ; end of module full_adder
; yosys-smt2-topmod full_adder
; end of yosys output
