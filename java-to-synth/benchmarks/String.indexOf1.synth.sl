; java.lang.String.indexOf
; public int indexOf(int)
; solved by both cvc4 and fastsynth. fastsynth is faster 75s to 125s (plus cvc4 needs grammar)
; inputs
(declare-var index Int)
(declare-var index! Int)
(declare-var str (Array Int Int))
(declare-var ch Int)
(declare-var loc Int)
(declare-var loc! Int)

; sketch
(synth-fun |hole|
  (
    (index Int)
    (str (Array Int Int))
    (ch Int)
  )
  Int
;  ((I Int) (B Bool) (C Bool))
; ((I Int (0 1 (- 1) (ite B I I)
; (+ I I)
; (- I)
; index
; (select str 0)
; (select str 1)
; (select str index)
; ch
; ))
; (B Bool ((and B B) (or B B) (not B) (and C C) (or C C)))
; (C Bool ((= I I) (<= I I) (>= I I)
; ))
; )
)


(define-fun trans ((index Int) (str (Array Int Int))(ch Int)(loc Int)(index! Int)(loc! Int) ) Bool
(and
  (= index! (+ index 1))
  (ite (> loc (- 1)) (= loc! loc)
    (= loc! (hole index str ch)))))


; precondition
(define-fun pre 
  (
    (index Int)
    (loc Int)
  )
  Bool
  (and (= index 0) (= loc (- 1))(= loc! (- 1))))

; postcondition when ch is found

(define-fun post ((index Int) (str (Array Int Int))(ch Int)(loc Int)) Bool
  (and (>= index 0)
  (ite (forall ((i Int)) (=> (and (< i index)(>= i 0)) (not (= (select str i) ch))))
    (= loc (- 1))
    (= loc 1))))

; postcondition when ch is not found

(constraint (=> (pre index loc)(post index str ch loc )))
;(constraint (=> (and (post index loc)(trans index str ch loc index! loc!))(post index! str ch loc!)))
(constraint (=> (and (post index str ch loc) (trans index str ch loc index! loc!)) (post index! str ch loc!)))

(check-synth)