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
(bvult t (bvnot (_ bv0 32)))
)

(assert
 (not
  (and
  (=> (SC s t) (exists ((x (_ BitVec 32))) (bvugt (bvashr x s) t)))
  (=> (exists ((x (_ BitVec 32))) (bvugt (bvashr x s) t)) (SC s t))
  )
 )
)
(check-sat)
(exit)
