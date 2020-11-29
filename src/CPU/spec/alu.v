Require Import Arith.
Require Import ZArith.
Require Import BinInt.
From Hammer Require Import Tactics.
From Hammer Require Import Hammer.

Inductive Flag : Type :=
|ArithError
|Eq
|None.

Inductive ROp : Type :=
|Reg (name: nat) (val: Z).

Inductive ArithROp : Type :=
| Add (arg: ROp * ROp)
| Sub (arg: ROp * ROp)
| Mul (arg: ROp * ROp)
| Div (arg: ROp * ROp)
| And (arg: ROp * ROp)
| Or  (arg: ROp * ROp)
| Xor (arg: ROp * ROp)
| Not (arg: ROp)
| Sll (arg: ROp * ROp)
| Srl (arg: ROp * ROp)
| Cmp (arg: ROp * ROp).


Definition add_signed (a : Z) (b : Z) : Z := a + b.
Definition sub_signed (a : Z) (b : Z) : Z := a - b.
Definition mul_signed (a : Z) (b : Z) : Z := a * b.
Definition div_signed (a : Z) (b : Z) : Z := a / b.


Definition exec (inst: ArithROp) : ROp := 
match inst with
|Add (Reg dest a,Reg _ b) => Reg dest (add_signed a b)
|Sub (Reg dest a,Reg _ b) => Reg dest (sub_signed a b)
|Mul (Reg dest a,Reg _ b) => Reg dest (mul_signed a b)
|Div (Reg dest a,Reg _ b) => Reg dest (div_signed a b)
|And (Reg dest a,Reg _ b) => Reg dest (Z.land     a b)
|Or  (Reg dest a,Reg _ b) => Reg dest (Z.lor      a b)
|Xor (Reg dest a,Reg _ b) => Reg dest (Z.lxor     a b)
|Not (Reg dest a)         => Reg dest (-a)
|Sll (Reg dest a,Reg _ b) => Reg dest (Z.shiftl a b)
|Srl (Reg dest a,Reg _ b) => Reg dest (Z.shiftl a b)
|_ =>  Reg 0 (Z.land 1 1)
end.


Lemma exec_add : forall b a: Z, forall x y:nat, exec (Add (Reg x b,Reg y a)) = Reg x (a + b).
Proof.
intros.
simpl.
unfold add_signed.
scongruence use: Z.add_comm.
Qed.

