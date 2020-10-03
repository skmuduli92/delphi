; org.apache.commons.lang3.StringUtils
; public static String center(String str, final int size, final char padChar)

; inputs
(declare-var |str.size| Int)
(declare-var |str| (Array Int Int))
(declare-var |size| Int)
(declare-var |padChar| Int)

; ; sketch
; (synth-fun |hole-char|
;   (
;     (|i| Int)
;     (|str.size| Int)
;     (|str| (Array Int Int))
;     (|size| Int)
;     (|padChar| Int)
;   )
;   Int)

; (define-fun |return|
;   (
;     (|i| Int)
;     (|str.size| Int)
;     (|str| (Array Int Int))
;     (|size| Int)
;     (|padChar| Int)
;   )
;   Int
;   (|hole-char| |i| |str.size| |str| |size| |padChar|))

(synth-fun |hole-size|
  (
    (|str.size| Int)
    (|str| (Array Int Int))
    (|size| Int)
    (|padChar| Int)
  )
  Int)

(define-fun |return.size|
  (
    (|str.size| Int)
    (|str| (Array Int Int))
    (|size| Int)
    (|padChar| Int)
  )
  Int
  (|hole-size| |str.size| |str| |size| |padChar|))

; precondition
(define-fun pre 
  (
    (|str.size| Int)
    (|str| (Array Int Int))
    (|size| Int)
    (|padChar| Int)
  )
  Bool
  true)

; postcondition when string is long

(constraint (=>
  (and (pre |str.size| |str| |size| |padChar|) (>= |str.size| |size|))
  (= (|return.size| |str.size| |str| |size| |padChar|) |str.size|)))

; (constraint (=>
;   (and (pre |str.size| |str| |size| |padChar|) (>= |str.size| |size|))
;   (forall ((index Int)) (= (|return| index |str.size| |str| |size| |padChar|) (select |str| index)))))

; postcondition when string is short

(constraint (=>
  (and (pre |str.size| |str| |size| |padChar|) (< |str.size| |size|))
  (= (|return.size| |str.size| |str| |size| |padChar|) |size|)))

; (constraint (=>
;   (and (pre |str.size| |str| |size| |padChar|) (< |str.size| |size|))
;   (forall ((index Int)) (= (|return| index |str.size| |str| |size| |padChar|)
;     (ite (or (<= index (div (- |size| |str.size| ) 2))
;              (> index (+ (div (- |size| |str.size| ) 2) |str.size|)))
;       |padChar|
;       (select |str| (- index |str.size|)))))))

(check-synth)
