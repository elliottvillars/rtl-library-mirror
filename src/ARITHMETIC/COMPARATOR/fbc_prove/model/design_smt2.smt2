; SMT-LIBv2 description generated by Yosys 0.9+3627 (git sha1 06347b119b, g++ 9.3.0 -fPIC -Os)
; yosys-smt2-module look_ahead_logic_cell
(declare-sort |look_ahead_logic_cell_s| 0)
(declare-fun |look_ahead_logic_cell_is| (|look_ahead_logic_cell_s|) Bool)
(declare-fun |look_ahead_logic_cell#0| (|look_ahead_logic_cell_s|) (_ BitVec 1)) ; \i_OPERAND_A [3]
(declare-fun |look_ahead_logic_cell#1| (|look_ahead_logic_cell_s|) (_ BitVec 1)) ; \i_OPERAND_B [3]
(define-fun |look_ahead_logic_cell#2| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (bvxor (|look_ahead_logic_cell#0| state) (|look_ahead_logic_cell#1| state))) ; \w_TEMP_WIRE_3
; yosys-smt2-wire w_TEMP_WIRE_3 1
(define-fun |look_ahead_logic_cell_n w_TEMP_WIRE_3| ((state |look_ahead_logic_cell_s|)) Bool (= ((_ extract 0 0) (|look_ahead_logic_cell#2| state)) #b1))
(declare-fun |look_ahead_logic_cell#3| (|look_ahead_logic_cell_s|) (_ BitVec 1)) ; \i_OPERAND_A [2]
(declare-fun |look_ahead_logic_cell#4| (|look_ahead_logic_cell_s|) (_ BitVec 1)) ; \i_OPERAND_B [2]
(define-fun |look_ahead_logic_cell#5| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (bvxor (|look_ahead_logic_cell#3| state) (|look_ahead_logic_cell#4| state))) ; \w_TEMP_WIRE_2
; yosys-smt2-wire w_TEMP_WIRE_2 1
(define-fun |look_ahead_logic_cell_n w_TEMP_WIRE_2| ((state |look_ahead_logic_cell_s|)) Bool (= ((_ extract 0 0) (|look_ahead_logic_cell#5| state)) #b1))
(declare-fun |look_ahead_logic_cell#6| (|look_ahead_logic_cell_s|) (_ BitVec 1)) ; \i_OPERAND_A [1]
(declare-fun |look_ahead_logic_cell#7| (|look_ahead_logic_cell_s|) (_ BitVec 1)) ; \i_OPERAND_B [1]
(define-fun |look_ahead_logic_cell#8| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (bvxor (|look_ahead_logic_cell#6| state) (|look_ahead_logic_cell#7| state))) ; \w_TEMP_WIRE_1
; yosys-smt2-wire w_TEMP_WIRE_1 1
(define-fun |look_ahead_logic_cell_n w_TEMP_WIRE_1| ((state |look_ahead_logic_cell_s|)) Bool (= ((_ extract 0 0) (|look_ahead_logic_cell#8| state)) #b1))
(declare-fun |look_ahead_logic_cell#9| (|look_ahead_logic_cell_s|) (_ BitVec 1)) ; \i_OPERAND_A [0]
(declare-fun |look_ahead_logic_cell#10| (|look_ahead_logic_cell_s|) (_ BitVec 1)) ; \i_OPERAND_B [0]
(define-fun |look_ahead_logic_cell#11| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (bvxor (|look_ahead_logic_cell#9| state) (|look_ahead_logic_cell#10| state))) ; \w_TEMP_WIRE_0
; yosys-smt2-wire w_TEMP_WIRE_0 1
(define-fun |look_ahead_logic_cell_n w_TEMP_WIRE_0| ((state |look_ahead_logic_cell_s|)) Bool (= ((_ extract 0 0) (|look_ahead_logic_cell#11| state)) #b1))
(define-fun |look_ahead_logic_cell#12| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (bvnot (|look_ahead_logic_cell#2| state))) ; $not$./look_ahead_logic_cell.v:20$84_Y
(define-fun |look_ahead_logic_cell#13| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (bvnot (|look_ahead_logic_cell#5| state))) ; $not$./look_ahead_logic_cell.v:21$87_Y
(define-fun |look_ahead_logic_cell#14| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (bvand (|look_ahead_logic_cell#12| state) (|look_ahead_logic_cell#13| state))) ; $and$./look_ahead_logic_cell.v:21$88_Y
(define-fun |look_ahead_logic_cell#15| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (bvnot (|look_ahead_logic_cell#8| state))) ; $not$./look_ahead_logic_cell.v:22$93_Y
(define-fun |look_ahead_logic_cell#16| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (bvand (|look_ahead_logic_cell#14| state) (|look_ahead_logic_cell#15| state))) ; $and$./look_ahead_logic_cell.v:22$94_Y
(define-fun |look_ahead_logic_cell#17| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (bvand (|look_ahead_logic_cell#16| state) (|look_ahead_logic_cell#11| state))) ; \o_CMP_RESULT [0]
(define-fun |look_ahead_logic_cell#18| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (bvand (|look_ahead_logic_cell#14| state) (|look_ahead_logic_cell#8| state))) ; \o_CMP_RESULT [1]
(define-fun |look_ahead_logic_cell#19| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (bvand (|look_ahead_logic_cell#12| state) (|look_ahead_logic_cell#5| state))) ; \o_CMP_RESULT [2]
; yosys-smt2-output o_CMP_RESULT 4
; yosys-smt2-wire o_CMP_RESULT 4
(define-fun |look_ahead_logic_cell_n o_CMP_RESULT| ((state |look_ahead_logic_cell_s|)) (_ BitVec 4) (concat (|look_ahead_logic_cell#2| state) (concat (|look_ahead_logic_cell#19| state) (concat (|look_ahead_logic_cell#18| state) (|look_ahead_logic_cell#17| state)))))
; yosys-smt2-input i_OPERAND_B 4
; yosys-smt2-wire i_OPERAND_B 4
(define-fun |look_ahead_logic_cell_n i_OPERAND_B| ((state |look_ahead_logic_cell_s|)) (_ BitVec 4) (concat (|look_ahead_logic_cell#1| state) (concat (|look_ahead_logic_cell#4| state) (concat (|look_ahead_logic_cell#7| state) (|look_ahead_logic_cell#10| state)))))
; yosys-smt2-input i_OPERAND_A 4
; yosys-smt2-wire i_OPERAND_A 4
(define-fun |look_ahead_logic_cell_n i_OPERAND_A| ((state |look_ahead_logic_cell_s|)) (_ BitVec 4) (concat (|look_ahead_logic_cell#0| state) (concat (|look_ahead_logic_cell#3| state) (concat (|look_ahead_logic_cell#6| state) (|look_ahead_logic_cell#9| state)))))
(define-fun |look_ahead_logic_cell#20| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (bvnot (|look_ahead_logic_cell#17| state))) ; $not$./look_ahead_logic_cell.v:43$133_Y
; yosys-smt2-anyseq look_ahead_logic_cell#21 1 $auto$setundef.cc:501:execute$244
(declare-fun |look_ahead_logic_cell#21| (|look_ahead_logic_cell_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2811:Anyseq$245
(define-fun |look_ahead_logic_cell#22| ((state |look_ahead_logic_cell_s|)) Bool (= (|look_ahead_logic_cell#0| state) (|look_ahead_logic_cell#1| state))) ; $eq$./look_ahead_logic_cell.v:31$116_Y
(define-fun |look_ahead_logic_cell#23| ((state |look_ahead_logic_cell_s|)) Bool (= (|look_ahead_logic_cell#3| state) (|look_ahead_logic_cell#4| state))) ; $eq$./look_ahead_logic_cell.v:35$121_Y
(define-fun |look_ahead_logic_cell#24| ((state |look_ahead_logic_cell_s|)) Bool (and (or  (|look_ahead_logic_cell#22| state) false) (or  (|look_ahead_logic_cell#23| state) false))) ; $logic_and$./look_ahead_logic_cell.v:35$122_Y
(define-fun |look_ahead_logic_cell#25| ((state |look_ahead_logic_cell_s|)) Bool (= (|look_ahead_logic_cell#6| state) (|look_ahead_logic_cell#7| state))) ; $eq$./look_ahead_logic_cell.v:40$129_Y
(define-fun |look_ahead_logic_cell#26| ((state |look_ahead_logic_cell_s|)) Bool (and (or  (|look_ahead_logic_cell#24| state) false) (or  (|look_ahead_logic_cell#25| state) false))) ; $logic_and$./look_ahead_logic_cell.v:39$130_Y
(define-fun |look_ahead_logic_cell#27| ((state |look_ahead_logic_cell_s|)) Bool (distinct (|look_ahead_logic_cell#9| state) (|look_ahead_logic_cell#10| state))) ; $ne$./look_ahead_logic_cell.v:40$131_Y
(define-fun |look_ahead_logic_cell#28| ((state |look_ahead_logic_cell_s|)) Bool (and (or  (|look_ahead_logic_cell#26| state) false) (or  (|look_ahead_logic_cell#27| state) false))) ; $logic_and$./look_ahead_logic_cell.v:39$132_Y
(define-fun |look_ahead_logic_cell#29| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (ite (|look_ahead_logic_cell#28| state) (|look_ahead_logic_cell#21| state) (|look_ahead_logic_cell#20| state))) ; $0$formal$./look_ahead_logic_cell.v:42$79_CHECK[0:0]$111
(define-fun |look_ahead_logic_cell#30| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (ite (|look_ahead_logic_cell#28| state) #b0 #b1)) ; $0$formal$./look_ahead_logic_cell.v:42$79_EN[0:0]$112
; yosys-smt2-assert 0 ./look_ahead_logic_cell.v:42.7-43.28
(define-fun |look_ahead_logic_cell_a 0| ((state |look_ahead_logic_cell_s|)) Bool (or (= ((_ extract 0 0) (|look_ahead_logic_cell#29| state)) #b1) (not (= ((_ extract 0 0) (|look_ahead_logic_cell#30| state)) #b1)))) ; $assert$./look_ahead_logic_cell.v:42$141
; yosys-smt2-anyseq look_ahead_logic_cell#31 1 $auto$setundef.cc:501:execute$242
(declare-fun |look_ahead_logic_cell#31| (|look_ahead_logic_cell_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2811:Anyseq$243
(define-fun |look_ahead_logic_cell#32| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (ite (|look_ahead_logic_cell#28| state) (|look_ahead_logic_cell#17| state) (|look_ahead_logic_cell#31| state))) ; $0$formal$./look_ahead_logic_cell.v:40$78_CHECK[0:0]$109
(define-fun |look_ahead_logic_cell#33| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (ite (|look_ahead_logic_cell#28| state) #b1 #b0)) ; $0$formal$./look_ahead_logic_cell.v:40$78_EN[0:0]$110
; yosys-smt2-assert 1 ./look_ahead_logic_cell.v:40.73-41.27
(define-fun |look_ahead_logic_cell_a 1| ((state |look_ahead_logic_cell_s|)) Bool (or (= ((_ extract 0 0) (|look_ahead_logic_cell#32| state)) #b1) (not (= ((_ extract 0 0) (|look_ahead_logic_cell#33| state)) #b1)))) ; $assert$./look_ahead_logic_cell.v:40$140
(define-fun |look_ahead_logic_cell#34| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (bvnot (|look_ahead_logic_cell#18| state))) ; $not$./look_ahead_logic_cell.v:38$125_Y
; yosys-smt2-anyseq look_ahead_logic_cell#35 1 $auto$setundef.cc:501:execute$240
(declare-fun |look_ahead_logic_cell#35| (|look_ahead_logic_cell_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2811:Anyseq$241
(define-fun |look_ahead_logic_cell#36| ((state |look_ahead_logic_cell_s|)) Bool (distinct (|look_ahead_logic_cell#6| state) (|look_ahead_logic_cell#7| state))) ; $ne$./look_ahead_logic_cell.v:35$123_Y
(define-fun |look_ahead_logic_cell#37| ((state |look_ahead_logic_cell_s|)) Bool (and (or  (|look_ahead_logic_cell#24| state) false) (or  (|look_ahead_logic_cell#36| state) false))) ; $logic_and$./look_ahead_logic_cell.v:35$124_Y
(define-fun |look_ahead_logic_cell#38| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (ite (|look_ahead_logic_cell#37| state) (|look_ahead_logic_cell#35| state) (|look_ahead_logic_cell#34| state))) ; $0$formal$./look_ahead_logic_cell.v:37$77_CHECK[0:0]$107
(define-fun |look_ahead_logic_cell#39| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (ite (|look_ahead_logic_cell#37| state) #b0 #b1)) ; $0$formal$./look_ahead_logic_cell.v:37$77_EN[0:0]$108
; yosys-smt2-assert 2 ./look_ahead_logic_cell.v:37.7-38.28
(define-fun |look_ahead_logic_cell_a 2| ((state |look_ahead_logic_cell_s|)) Bool (or (= ((_ extract 0 0) (|look_ahead_logic_cell#38| state)) #b1) (not (= ((_ extract 0 0) (|look_ahead_logic_cell#39| state)) #b1)))) ; $assert$./look_ahead_logic_cell.v:37$139
; yosys-smt2-anyseq look_ahead_logic_cell#40 1 $auto$setundef.cc:501:execute$238
(declare-fun |look_ahead_logic_cell#40| (|look_ahead_logic_cell_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2811:Anyseq$239
(define-fun |look_ahead_logic_cell#41| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (ite (|look_ahead_logic_cell#37| state) (|look_ahead_logic_cell#18| state) (|look_ahead_logic_cell#40| state))) ; $0$formal$./look_ahead_logic_cell.v:35$76_CHECK[0:0]$105
(define-fun |look_ahead_logic_cell#42| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (ite (|look_ahead_logic_cell#37| state) #b1 #b0)) ; $0$formal$./look_ahead_logic_cell.v:35$76_EN[0:0]$106
; yosys-smt2-assert 3 ./look_ahead_logic_cell.v:35.111-36.27
(define-fun |look_ahead_logic_cell_a 3| ((state |look_ahead_logic_cell_s|)) Bool (or (= ((_ extract 0 0) (|look_ahead_logic_cell#41| state)) #b1) (not (= ((_ extract 0 0) (|look_ahead_logic_cell#42| state)) #b1)))) ; $assert$./look_ahead_logic_cell.v:35$138
(define-fun |look_ahead_logic_cell#43| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (bvnot (|look_ahead_logic_cell#19| state))) ; $not$./look_ahead_logic_cell.v:34$119_Y
; yosys-smt2-anyseq look_ahead_logic_cell#44 1 $auto$setundef.cc:501:execute$236
(declare-fun |look_ahead_logic_cell#44| (|look_ahead_logic_cell_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2811:Anyseq$237
(define-fun |look_ahead_logic_cell#45| ((state |look_ahead_logic_cell_s|)) Bool (distinct (|look_ahead_logic_cell#3| state) (|look_ahead_logic_cell#4| state))) ; $ne$./look_ahead_logic_cell.v:31$117_Y
(define-fun |look_ahead_logic_cell#46| ((state |look_ahead_logic_cell_s|)) Bool (and (or  (|look_ahead_logic_cell#22| state) false) (or  (|look_ahead_logic_cell#45| state) false))) ; $logic_and$./look_ahead_logic_cell.v:31$118_Y
(define-fun |look_ahead_logic_cell#47| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (ite (|look_ahead_logic_cell#46| state) (|look_ahead_logic_cell#44| state) (|look_ahead_logic_cell#43| state))) ; $0$formal$./look_ahead_logic_cell.v:33$75_CHECK[0:0]$103
(define-fun |look_ahead_logic_cell#48| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (ite (|look_ahead_logic_cell#46| state) #b0 #b1)) ; $0$formal$./look_ahead_logic_cell.v:33$75_EN[0:0]$104
; yosys-smt2-assert 4 ./look_ahead_logic_cell.v:33.7-34.28
(define-fun |look_ahead_logic_cell_a 4| ((state |look_ahead_logic_cell_s|)) Bool (or (= ((_ extract 0 0) (|look_ahead_logic_cell#47| state)) #b1) (not (= ((_ extract 0 0) (|look_ahead_logic_cell#48| state)) #b1)))) ; $assert$./look_ahead_logic_cell.v:33$137
; yosys-smt2-anyseq look_ahead_logic_cell#49 1 $auto$setundef.cc:501:execute$234
(declare-fun |look_ahead_logic_cell#49| (|look_ahead_logic_cell_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2811:Anyseq$235
(define-fun |look_ahead_logic_cell#50| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (ite (|look_ahead_logic_cell#46| state) (|look_ahead_logic_cell#19| state) (|look_ahead_logic_cell#49| state))) ; $0$formal$./look_ahead_logic_cell.v:31$74_CHECK[0:0]$101
(define-fun |look_ahead_logic_cell#51| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (ite (|look_ahead_logic_cell#46| state) #b1 #b0)) ; $0$formal$./look_ahead_logic_cell.v:31$74_EN[0:0]$102
; yosys-smt2-assert 5 ./look_ahead_logic_cell.v:31.75-32.27
(define-fun |look_ahead_logic_cell_a 5| ((state |look_ahead_logic_cell_s|)) Bool (or (= ((_ extract 0 0) (|look_ahead_logic_cell#50| state)) #b1) (not (= ((_ extract 0 0) (|look_ahead_logic_cell#51| state)) #b1)))) ; $assert$./look_ahead_logic_cell.v:31$136
; yosys-smt2-anyseq look_ahead_logic_cell#52 1 $auto$setundef.cc:501:execute$232
(declare-fun |look_ahead_logic_cell#52| (|look_ahead_logic_cell_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2811:Anyseq$233
(define-fun |look_ahead_logic_cell#53| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (ite (= ((_ extract 0 0) (|look_ahead_logic_cell#2| state)) #b1) (|look_ahead_logic_cell#52| state) (|look_ahead_logic_cell#12| state))) ; $0$formal$./look_ahead_logic_cell.v:29$73_CHECK[0:0]$99
(define-fun |look_ahead_logic_cell#54| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (ite (= ((_ extract 0 0) (|look_ahead_logic_cell#2| state)) #b1) #b0 #b1)) ; $0$formal$./look_ahead_logic_cell.v:29$73_EN[0:0]$100
; yosys-smt2-assert 6 ./look_ahead_logic_cell.v:29.7-30.28
(define-fun |look_ahead_logic_cell_a 6| ((state |look_ahead_logic_cell_s|)) Bool (or (= ((_ extract 0 0) (|look_ahead_logic_cell#53| state)) #b1) (not (= ((_ extract 0 0) (|look_ahead_logic_cell#54| state)) #b1)))) ; $assert$./look_ahead_logic_cell.v:29$135
; yosys-smt2-anyseq look_ahead_logic_cell#55 1 $auto$setundef.cc:501:execute$230
(declare-fun |look_ahead_logic_cell#55| (|look_ahead_logic_cell_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2811:Anyseq$231
(define-fun |look_ahead_logic_cell#56| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (ite (= ((_ extract 0 0) (|look_ahead_logic_cell#2| state)) #b1) #b1 (|look_ahead_logic_cell#55| state))) ; $0$formal$./look_ahead_logic_cell.v:27$72_CHECK[0:0]$97
(define-fun |look_ahead_logic_cell#57| ((state |look_ahead_logic_cell_s|)) (_ BitVec 1) (ite (= ((_ extract 0 0) (|look_ahead_logic_cell#2| state)) #b1) #b1 #b0)) ; $0$formal$./look_ahead_logic_cell.v:27$72_EN[0:0]$98
; yosys-smt2-assert 7 ./look_ahead_logic_cell.v:27.46-28.27
(define-fun |look_ahead_logic_cell_a 7| ((state |look_ahead_logic_cell_s|)) Bool (or (= ((_ extract 0 0) (|look_ahead_logic_cell#56| state)) #b1) (not (= ((_ extract 0 0) (|look_ahead_logic_cell#57| state)) #b1)))) ; $assert$./look_ahead_logic_cell.v:27$134
(define-fun |look_ahead_logic_cell_a| ((state |look_ahead_logic_cell_s|)) Bool (and
  (|look_ahead_logic_cell_a 0| state)
  (|look_ahead_logic_cell_a 1| state)
  (|look_ahead_logic_cell_a 2| state)
  (|look_ahead_logic_cell_a 3| state)
  (|look_ahead_logic_cell_a 4| state)
  (|look_ahead_logic_cell_a 5| state)
  (|look_ahead_logic_cell_a 6| state)
  (|look_ahead_logic_cell_a 7| state)
))
(define-fun |look_ahead_logic_cell_u| ((state |look_ahead_logic_cell_s|)) Bool true)
(define-fun |look_ahead_logic_cell_i| ((state |look_ahead_logic_cell_s|)) Bool true)
(define-fun |look_ahead_logic_cell_h| ((state |look_ahead_logic_cell_s|)) Bool true)
(define-fun |look_ahead_logic_cell_t| ((state |look_ahead_logic_cell_s|) (next_state |look_ahead_logic_cell_s|)) Bool true) ; end of module look_ahead_logic_cell
; yosys-smt2-module four_bit_comparator
(declare-sort |four_bit_comparator_s| 0)
(declare-fun |four_bit_comparator_is| (|four_bit_comparator_s|) Bool)
(declare-fun |four_bit_comparator#0| (|four_bit_comparator_s|) (_ BitVec 1)) ; \i_OPERAND_A [0]
(declare-fun |four_bit_comparator#1| (|four_bit_comparator_s|) (_ BitVec 1)) ; \i_OPERAND_B [0]
(define-fun |four_bit_comparator#2| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvnot (|four_bit_comparator#1| state))) ; $not$./four_bit_comparator.v:27$19_Y
(define-fun |four_bit_comparator#3| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvand (|four_bit_comparator#0| state) (|four_bit_comparator#2| state))) ; $and$./four_bit_comparator.v:27$20_Y
; yosys-smt2-cell look_ahead_logic_cell cmp
(declare-fun |four_bit_comparator#4| (|four_bit_comparator_s|) (_ BitVec 4)) ; \w_CMP_RESULT
(declare-fun |four_bit_comparator_h cmp| (|four_bit_comparator_s|) |look_ahead_logic_cell_s|)
(define-fun |four_bit_comparator#5| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvand (|four_bit_comparator#3| state) ((_ extract 0 0) (|four_bit_comparator#4| state)))) ; \w_Si [0]
(declare-fun |four_bit_comparator#6| (|four_bit_comparator_s|) (_ BitVec 1)) ; \i_OPERAND_A [1]
(declare-fun |four_bit_comparator#7| (|four_bit_comparator_s|) (_ BitVec 1)) ; \i_OPERAND_B [1]
(define-fun |four_bit_comparator#8| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvnot (|four_bit_comparator#7| state))) ; $not$./four_bit_comparator.v:28$22_Y
(define-fun |four_bit_comparator#9| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvand (|four_bit_comparator#6| state) (|four_bit_comparator#8| state))) ; $and$./four_bit_comparator.v:28$23_Y
(define-fun |four_bit_comparator#10| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvand (|four_bit_comparator#9| state) ((_ extract 1 1) (|four_bit_comparator#4| state)))) ; \w_Si [1]
(declare-fun |four_bit_comparator#11| (|four_bit_comparator_s|) (_ BitVec 1)) ; \i_OPERAND_A [2]
(declare-fun |four_bit_comparator#12| (|four_bit_comparator_s|) (_ BitVec 1)) ; \i_OPERAND_B [2]
(define-fun |four_bit_comparator#13| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvnot (|four_bit_comparator#12| state))) ; $not$./four_bit_comparator.v:29$25_Y
(define-fun |four_bit_comparator#14| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvand (|four_bit_comparator#11| state) (|four_bit_comparator#13| state))) ; $and$./four_bit_comparator.v:29$26_Y
(define-fun |four_bit_comparator#15| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvand (|four_bit_comparator#14| state) ((_ extract 2 2) (|four_bit_comparator#4| state)))) ; \w_Si [2]
(declare-fun |four_bit_comparator#16| (|four_bit_comparator_s|) (_ BitVec 1)) ; \i_OPERAND_A [3]
(declare-fun |four_bit_comparator#17| (|four_bit_comparator_s|) (_ BitVec 1)) ; \i_OPERAND_B [3]
(define-fun |four_bit_comparator#18| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvnot (|four_bit_comparator#17| state))) ; $not$./four_bit_comparator.v:30$28_Y
(define-fun |four_bit_comparator#19| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvand (|four_bit_comparator#16| state) (|four_bit_comparator#18| state))) ; $and$./four_bit_comparator.v:30$29_Y
(define-fun |four_bit_comparator#20| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvand (|four_bit_comparator#19| state) ((_ extract 3 3) (|four_bit_comparator#4| state)))) ; \w_Si [3]
; yosys-smt2-wire w_Si 4
(define-fun |four_bit_comparator_n w_Si| ((state |four_bit_comparator_s|)) (_ BitVec 4) (concat (|four_bit_comparator#20| state) (concat (|four_bit_comparator#15| state) (concat (|four_bit_comparator#10| state) (|four_bit_comparator#5| state)))))
(define-fun |four_bit_comparator#21| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvnot (|four_bit_comparator#0| state))) ; $not$./four_bit_comparator.v:22$7_Y
(define-fun |four_bit_comparator#22| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvand (|four_bit_comparator#21| state) (|four_bit_comparator#1| state))) ; $and$./four_bit_comparator.v:22$8_Y
(define-fun |four_bit_comparator#23| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvand (|four_bit_comparator#22| state) ((_ extract 0 0) (|four_bit_comparator#4| state)))) ; \w_Gi [0]
(define-fun |four_bit_comparator#24| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvnot (|four_bit_comparator#6| state))) ; $not$./four_bit_comparator.v:23$10_Y
(define-fun |four_bit_comparator#25| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvand (|four_bit_comparator#24| state) (|four_bit_comparator#7| state))) ; $and$./four_bit_comparator.v:23$11_Y
(define-fun |four_bit_comparator#26| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvand (|four_bit_comparator#25| state) ((_ extract 1 1) (|four_bit_comparator#4| state)))) ; \w_Gi [1]
(define-fun |four_bit_comparator#27| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvnot (|four_bit_comparator#11| state))) ; $not$./four_bit_comparator.v:24$13_Y
(define-fun |four_bit_comparator#28| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvand (|four_bit_comparator#27| state) (|four_bit_comparator#12| state))) ; $and$./four_bit_comparator.v:24$14_Y
(define-fun |four_bit_comparator#29| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvand (|four_bit_comparator#28| state) ((_ extract 2 2) (|four_bit_comparator#4| state)))) ; \w_Gi [2]
(define-fun |four_bit_comparator#30| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvnot (|four_bit_comparator#16| state))) ; $not$./four_bit_comparator.v:25$16_Y
(define-fun |four_bit_comparator#31| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvand (|four_bit_comparator#30| state) (|four_bit_comparator#17| state))) ; $and$./four_bit_comparator.v:25$17_Y
(define-fun |four_bit_comparator#32| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvand (|four_bit_comparator#31| state) ((_ extract 3 3) (|four_bit_comparator#4| state)))) ; \w_Gi [3]
; yosys-smt2-wire w_Gi 4
(define-fun |four_bit_comparator_n w_Gi| ((state |four_bit_comparator_s|)) (_ BitVec 4) (concat (|four_bit_comparator#32| state) (concat (|four_bit_comparator#29| state) (concat (|four_bit_comparator#26| state) (|four_bit_comparator#23| state)))))
; yosys-smt2-wire w_CMP_RESULT 4
(define-fun |four_bit_comparator_n w_CMP_RESULT| ((state |four_bit_comparator_s|)) (_ BitVec 4) (|four_bit_comparator#4| state))
(define-fun |four_bit_comparator#33| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvor (|four_bit_comparator#23| state) (|four_bit_comparator#26| state))) ; $or$./four_bit_comparator.v:32$31_Y
(define-fun |four_bit_comparator#34| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvor (|four_bit_comparator#33| state) (|four_bit_comparator#29| state))) ; $or$./four_bit_comparator.v:32$32_Y
(define-fun |four_bit_comparator#35| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvor (|four_bit_comparator#34| state) (|four_bit_comparator#32| state))) ; \o_LT
; yosys-smt2-output o_LT 1
; yosys-smt2-wire o_LT 1
(define-fun |four_bit_comparator_n o_LT| ((state |four_bit_comparator_s|)) Bool (= ((_ extract 0 0) (|four_bit_comparator#35| state)) #b1))
(define-fun |four_bit_comparator#36| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvor (|four_bit_comparator#5| state) (|four_bit_comparator#10| state))) ; $or$./four_bit_comparator.v:33$34_Y
(define-fun |four_bit_comparator#37| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvor (|four_bit_comparator#36| state) (|four_bit_comparator#15| state))) ; $or$./four_bit_comparator.v:33$35_Y
(define-fun |four_bit_comparator#38| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvor (|four_bit_comparator#37| state) (|four_bit_comparator#20| state))) ; \o_GT
; yosys-smt2-output o_GT 1
; yosys-smt2-wire o_GT 1
(define-fun |four_bit_comparator_n o_GT| ((state |four_bit_comparator_s|)) Bool (= ((_ extract 0 0) (|four_bit_comparator#38| state)) #b1))
(define-fun |four_bit_comparator#39| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvor (|four_bit_comparator#35| state) (|four_bit_comparator#38| state))) ; $not$./four_bit_comparator.v:43$55_Y
(define-fun |four_bit_comparator#40| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvnot (|four_bit_comparator#39| state))) ; \o_EQ
; yosys-smt2-output o_EQ 1
; yosys-smt2-wire o_EQ 1
(define-fun |four_bit_comparator_n o_EQ| ((state |four_bit_comparator_s|)) Bool (= ((_ extract 0 0) (|four_bit_comparator#40| state)) #b1))
; yosys-smt2-input i_OPERAND_B 4
; yosys-smt2-wire i_OPERAND_B 4
(define-fun |four_bit_comparator_n i_OPERAND_B| ((state |four_bit_comparator_s|)) (_ BitVec 4) (concat (|four_bit_comparator#17| state) (concat (|four_bit_comparator#12| state) (concat (|four_bit_comparator#7| state) (|four_bit_comparator#1| state)))))
; yosys-smt2-input i_OPERAND_A 4
; yosys-smt2-wire i_OPERAND_A 4
(define-fun |four_bit_comparator_n i_OPERAND_A| ((state |four_bit_comparator_s|)) (_ BitVec 4) (concat (|four_bit_comparator#16| state) (concat (|four_bit_comparator#11| state) (concat (|four_bit_comparator#6| state) (|four_bit_comparator#0| state)))))
(define-fun |four_bit_comparator#41| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvnot (|four_bit_comparator#38| state))) ; $not$./four_bit_comparator.v:43$53_Y
(define-fun |four_bit_comparator#42| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvand (|four_bit_comparator#40| state) (|four_bit_comparator#41| state))) ; $and$./four_bit_comparator.v:47$63_Y
(define-fun |four_bit_comparator#43| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvnot (|four_bit_comparator#35| state))) ; $not$./four_bit_comparator.v:45$58_Y
(define-fun |four_bit_comparator#44| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvand (|four_bit_comparator#42| state) (|four_bit_comparator#43| state))) ; $and$./four_bit_comparator.v:47$65_Y
; yosys-smt2-anyseq four_bit_comparator#45 1 $auto$setundef.cc:501:execute$226
(declare-fun |four_bit_comparator#45| (|four_bit_comparator_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2811:Anyseq$227
(define-fun |four_bit_comparator#46| ((state |four_bit_comparator_s|)) Bool (bvugt (concat (|four_bit_comparator#16| state) (concat (|four_bit_comparator#11| state) (concat (|four_bit_comparator#6| state) (|four_bit_comparator#0| state)))) (concat (|four_bit_comparator#17| state) (concat (|four_bit_comparator#12| state) (concat (|four_bit_comparator#7| state) (|four_bit_comparator#1| state)))))) ; $gt$./four_bit_comparator.v:44$57_Y
(define-fun |four_bit_comparator#47| ((state |four_bit_comparator_s|)) (_ BitVec 1) (ite (|four_bit_comparator#46| state) (|four_bit_comparator#45| state) (|four_bit_comparator#44| state))) ; $procmux$215_Y
; yosys-smt2-anyseq four_bit_comparator#48 1 $auto$setundef.cc:501:execute$228
(declare-fun |four_bit_comparator#48| (|four_bit_comparator_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2811:Anyseq$229
(define-fun |four_bit_comparator#49| ((state |four_bit_comparator_s|)) Bool (bvult (concat (|four_bit_comparator#16| state) (concat (|four_bit_comparator#11| state) (concat (|four_bit_comparator#6| state) (|four_bit_comparator#0| state)))) (concat (|four_bit_comparator#17| state) (concat (|four_bit_comparator#12| state) (concat (|four_bit_comparator#7| state) (|four_bit_comparator#1| state)))))) ; $lt$./four_bit_comparator.v:42$52_Y
(define-fun |four_bit_comparator#50| ((state |four_bit_comparator_s|)) (_ BitVec 1) (ite (|four_bit_comparator#49| state) (|four_bit_comparator#48| state) (|four_bit_comparator#47| state))) ; $0$formal$./four_bit_comparator.v:46$6_CHECK[0:0]$50
(define-fun |four_bit_comparator#51| ((state |four_bit_comparator_s|)) (_ BitVec 1) (ite (|four_bit_comparator#46| state) #b0 #b1)) ; $procmux$209_Y
(define-fun |four_bit_comparator#52| ((state |four_bit_comparator_s|)) (_ BitVec 1) (ite (|four_bit_comparator#49| state) #b0 (|four_bit_comparator#51| state))) ; $0$formal$./four_bit_comparator.v:46$6_EN[0:0]$51
; yosys-smt2-assert 0 ./four_bit_comparator.v:46.7-47.32
(define-fun |four_bit_comparator_a 0| ((state |four_bit_comparator_s|)) Bool (or (= ((_ extract 0 0) (|four_bit_comparator#50| state)) #b1) (not (= ((_ extract 0 0) (|four_bit_comparator#52| state)) #b1)))) ; $assert$./four_bit_comparator.v:46$71
; yosys-smt2-anyseq four_bit_comparator#53 1 $auto$setundef.cc:501:execute$222
(declare-fun |four_bit_comparator#53| (|four_bit_comparator_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2811:Anyseq$223
(define-fun |four_bit_comparator#54| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvand (|four_bit_comparator#38| state) (|four_bit_comparator#43| state))) ; $and$./four_bit_comparator.v:45$59_Y
(define-fun |four_bit_comparator#55| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvand (|four_bit_comparator#54| state) (|four_bit_comparator#39| state))) ; $and$./four_bit_comparator.v:45$61_Y
(define-fun |four_bit_comparator#56| ((state |four_bit_comparator_s|)) (_ BitVec 1) (ite (|four_bit_comparator#46| state) (|four_bit_comparator#55| state) (|four_bit_comparator#53| state))) ; $procmux$203_Y
; yosys-smt2-anyseq four_bit_comparator#57 1 $auto$setundef.cc:501:execute$224
(declare-fun |four_bit_comparator#57| (|four_bit_comparator_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2811:Anyseq$225
(define-fun |four_bit_comparator#58| ((state |four_bit_comparator_s|)) (_ BitVec 1) (ite (|four_bit_comparator#49| state) (|four_bit_comparator#57| state) (|four_bit_comparator#56| state))) ; $0$formal$./four_bit_comparator.v:44$5_CHECK[0:0]$48
(define-fun |four_bit_comparator#59| ((state |four_bit_comparator_s|)) (_ BitVec 1) (ite (|four_bit_comparator#46| state) #b1 #b0)) ; $procmux$197_Y
(define-fun |four_bit_comparator#60| ((state |four_bit_comparator_s|)) (_ BitVec 1) (ite (|four_bit_comparator#49| state) #b0 (|four_bit_comparator#59| state))) ; $0$formal$./four_bit_comparator.v:44$5_EN[0:0]$49
; yosys-smt2-assert 1 ./four_bit_comparator.v:44.37-45.32
(define-fun |four_bit_comparator_a 1| ((state |four_bit_comparator_s|)) Bool (or (= ((_ extract 0 0) (|four_bit_comparator#58| state)) #b1) (not (= ((_ extract 0 0) (|four_bit_comparator#60| state)) #b1)))) ; $assert$./four_bit_comparator.v:44$70
; yosys-smt2-anyseq four_bit_comparator#61 1 $auto$setundef.cc:501:execute$220
(declare-fun |four_bit_comparator#61| (|four_bit_comparator_s|) (_ BitVec 1)) ; $auto$rtlil.cc:2811:Anyseq$221
(define-fun |four_bit_comparator#62| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvand (|four_bit_comparator#35| state) (|four_bit_comparator#41| state))) ; $and$./four_bit_comparator.v:43$54_Y
(define-fun |four_bit_comparator#63| ((state |four_bit_comparator_s|)) (_ BitVec 1) (bvand (|four_bit_comparator#62| state) (|four_bit_comparator#39| state))) ; $and$./four_bit_comparator.v:43$56_Y
(define-fun |four_bit_comparator#64| ((state |four_bit_comparator_s|)) (_ BitVec 1) (ite (|four_bit_comparator#49| state) (|four_bit_comparator#63| state) (|four_bit_comparator#61| state))) ; $0$formal$./four_bit_comparator.v:42$4_CHECK[0:0]$46
(define-fun |four_bit_comparator#65| ((state |four_bit_comparator_s|)) (_ BitVec 1) (ite (|four_bit_comparator#49| state) #b1 #b0)) ; $0$formal$./four_bit_comparator.v:42$4_EN[0:0]$47
; yosys-smt2-assert 2 ./four_bit_comparator.v:42.32-43.32
(define-fun |four_bit_comparator_a 2| ((state |four_bit_comparator_s|)) Bool (or (= ((_ extract 0 0) (|four_bit_comparator#64| state)) #b1) (not (= ((_ extract 0 0) (|four_bit_comparator#65| state)) #b1)))) ; $assert$./four_bit_comparator.v:42$69
(define-fun |four_bit_comparator_a| ((state |four_bit_comparator_s|)) Bool (and
  (|four_bit_comparator_a 0| state)
  (|four_bit_comparator_a 1| state)
  (|four_bit_comparator_a 2| state)
  (|look_ahead_logic_cell_a| (|four_bit_comparator_h cmp| state))
))
(define-fun |four_bit_comparator_u| ((state |four_bit_comparator_s|)) Bool 
  (|look_ahead_logic_cell_u| (|four_bit_comparator_h cmp| state))
)
(define-fun |four_bit_comparator_i| ((state |four_bit_comparator_s|)) Bool 
  (|look_ahead_logic_cell_i| (|four_bit_comparator_h cmp| state))
)
(define-fun |four_bit_comparator_h| ((state |four_bit_comparator_s|)) Bool (and
  (= (|four_bit_comparator_is| state) (|look_ahead_logic_cell_is| (|four_bit_comparator_h cmp| state)))
  (= (|four_bit_comparator#4| state) (|look_ahead_logic_cell_n o_CMP_RESULT| (|four_bit_comparator_h cmp| state))) ; look_ahead_logic_cell.o_CMP_RESULT
  (= (concat (|four_bit_comparator#17| state) (concat (|four_bit_comparator#12| state) (concat (|four_bit_comparator#7| state) (|four_bit_comparator#1| state)))) (|look_ahead_logic_cell_n i_OPERAND_B| (|four_bit_comparator_h cmp| state))) ; look_ahead_logic_cell.i_OPERAND_B
  (= (concat (|four_bit_comparator#16| state) (concat (|four_bit_comparator#11| state) (concat (|four_bit_comparator#6| state) (|four_bit_comparator#0| state)))) (|look_ahead_logic_cell_n i_OPERAND_A| (|four_bit_comparator_h cmp| state))) ; look_ahead_logic_cell.i_OPERAND_A
  (|look_ahead_logic_cell_h| (|four_bit_comparator_h cmp| state))
))
(define-fun |four_bit_comparator_t| ((state |four_bit_comparator_s|) (next_state |four_bit_comparator_s|)) Bool 
  (|look_ahead_logic_cell_t| (|four_bit_comparator_h cmp| state) (|four_bit_comparator_h cmp| next_state))
) ; end of module four_bit_comparator
; yosys-smt2-topmod four_bit_comparator
; end of yosys output