(set-logic BV)

(declare-fun x () (_ BitVec 32))

; (define-fun add10 ((x (_ BitVec 32))) (_ BitVec 32)
; 	(bvadd x (_ bv10 32)))

(declare-oracle-fun add10 /Users/kroening/progr/emu/examples/first_order/add10binary ((_ BitVec 32)) (_ BitVec 32))

(assert (not (= (add10 x) (_ bv20 32))))
(check-sat)
(get-model)