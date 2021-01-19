(set-info :smt-lib-version 2.6)
(set-logic BV)
(set-info :source |
Generated by: Mathias Preiner
Generated on: 2018-04-06
Application: Verification of invertibility conditions generated in [1].
Target solver: Boolector, CVC4, Z3
Publication:
[1] Solving Quantified Bit-Vectors using Invertibility Conditions
    Aina Niemetz, Mathias Preiner, Andrew Reynolds, Clark Barrett and Cesare Tinelli
    To appear in CAV 2018
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "crafted")
(set-info :status unsat)
(declare-fun s () (_ BitVec 32))
(declare-fun t () (_ BitVec 32))

;(define-fun udivtotal ((a (_ BitVec 32)) (b (_ BitVec 32))) (_ BitVec 32)
;  (ite (= b (_ bv0 32)) (bvnot (_ bv0 32)) (bvudiv a b))
;)

(declare-oracle-fun udivtotal udivtotal32 ((a (_ BitVec 32)) (b (_ BitVec 32))) (_ BitVec 32))

(define-fun uremtotal ((a (_ BitVec 32)) (b (_ BitVec 32))) (_ BitVec 32)
  (ite (= b (_ bv0 32)) a (bvurem a b))
)
(define-fun min () (_ BitVec 32)
  (bvnot (bvlshr (bvnot (_ bv0 32)) (_ bv1 32)))
)
(define-fun max () (_ BitVec 32)
  (bvnot min)
)

(define-fun SC ((s (_ BitVec 32)) (t (_ BitVec 32))) Bool
(or  (bvuge (bvshl s (_ bv0 32)) t) (bvuge (bvshl s (_ bv1 32)) t) (bvuge (bvshl s (_ bv2 32)) t) (bvuge (bvshl s (_ bv3 32)) t) (bvuge (bvshl s (_ bv4 32)) t) (bvuge (bvshl s (_ bv5 32)) t) (bvuge (bvshl s (_ bv6 32)) t) (bvuge (bvshl s (_ bv7 32)) t) (bvuge (bvshl s (_ bv8 32)) t) (bvuge (bvshl s (_ bv9 32)) t) (bvuge (bvshl s (_ bv10 32)) t) (bvuge (bvshl s (_ bv11 32)) t) (bvuge (bvshl s (_ bv12 32)) t) (bvuge (bvshl s (_ bv13 32)) t) (bvuge (bvshl s (_ bv14 32)) t) (bvuge (bvshl s (_ bv15 32)) t) (bvuge (bvshl s (_ bv16 32)) t) (bvuge (bvshl s (_ bv17 32)) t) (bvuge (bvshl s (_ bv18 32)) t) (bvuge (bvshl s (_ bv19 32)) t) (bvuge (bvshl s (_ bv20 32)) t) (bvuge (bvshl s (_ bv21 32)) t) (bvuge (bvshl s (_ bv22 32)) t) (bvuge (bvshl s (_ bv23 32)) t) (bvuge (bvshl s (_ bv24 32)) t) (bvuge (bvshl s (_ bv25 32)) t) (bvuge (bvshl s (_ bv26 32)) t) (bvuge (bvshl s (_ bv27 32)) t) (bvuge (bvshl s (_ bv28 32)) t) (bvuge (bvshl s (_ bv29 32)) t) (bvuge (bvshl s (_ bv30 32)) t) (bvuge (bvshl s (_ bv31 32)) t) (bvuge (bvshl s (_ bv32 32)) t))
)

(assert
 (not
  (and
  (=> (SC s t) (exists ((x (_ BitVec 32))) (bvuge (bvshl s x) t)))
  (=> (exists ((x (_ BitVec 32))) (bvuge (bvshl s x) t)) (SC s t))
  )
 )
)
(check-sat)
(exit)
