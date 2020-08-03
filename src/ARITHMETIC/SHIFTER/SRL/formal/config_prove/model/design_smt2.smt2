; SMT-LIBv2 description generated by Yosys 0.9+2406 (git sha1 000fd08198, g++ 9.3.0 -fPIC -Os)
; yosys-smt2-module srl
(declare-sort |srl_s| 0)
(declare-fun |srl_is| (|srl_s|) Bool)
; yosys-smt2-output o_RESULT 4
; yosys-smt2-wire o_RESULT 4
(declare-fun |srl#0| (|srl_s|) (_ BitVec 4)) ; \i_INPUT
(declare-fun |srl#1| (|srl_s|) (_ BitVec 3)) ; \i_SHIFT_AMOUNT
(define-fun |srl#2| ((state |srl_s|)) (_ BitVec 4) (bvlshr (|srl#0| state) (concat #b0 (|srl#1| state)))) ; \o_RESULT
(define-fun |srl_n o_RESULT| ((state |srl_s|)) (_ BitVec 4) (|srl#2| state))
; yosys-smt2-input i_SHIFT_AMOUNT 3
; yosys-smt2-wire i_SHIFT_AMOUNT 3
(define-fun |srl_n i_SHIFT_AMOUNT| ((state |srl_s|)) (_ BitVec 3) (|srl#1| state))
; yosys-smt2-input i_INPUT 4
; yosys-smt2-wire i_INPUT 4
(define-fun |srl_n i_INPUT| ((state |srl_s|)) (_ BitVec 4) (|srl#0| state))
; yosys-smt2-wire fr_MOCK_RESULT 4
(define-fun |srl_n fr_MOCK_RESULT| ((state |srl_s|)) (_ BitVec 4) (|srl#2| state))
; yosys-smt2-assert 0 srl.v:58.46-59.37
(define-fun |srl_a 0| ((state |srl_s|)) Bool (or true (not true))) ; $assert$srl.v:58$9
(define-fun |srl_a| ((state |srl_s|)) Bool 
  (|srl_a 0| state)
)
(define-fun |srl_u| ((state |srl_s|)) Bool true)
(define-fun |srl_i| ((state |srl_s|)) Bool true)
(define-fun |srl_h| ((state |srl_s|)) Bool true)
(define-fun |srl_t| ((state |srl_s|) (next_state |srl_s|)) Bool true) ; end of module srl
; yosys-smt2-topmod srl
; end of yosys output
