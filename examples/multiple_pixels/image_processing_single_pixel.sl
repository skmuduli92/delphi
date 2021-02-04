(set-logic BV)

(synth-fun tweak ((pixel (_ BitVec 8))(x (_ BitVec 8))(y (_ BitVec 8))) (_ BitVec 8))

; abusing pixel_oracle.sh both for 'correctness' and 'hints'

; correctness (verification)
(declare-oracle-fun pixel_correct ./pixel_oracle.sh ((-> (_ BitVec 8)(_ BitVec 8)(_ BitVec 8) (_ BitVec 8))) Bool)

(constraint (pixel_correct tweak))

; hints (synthesis)
(oracle-constraint
  ./pixel_oracle.sh
  ((tweak (-> (_ BitVec 8)(_ BitVec 8)(_ BitVec 8) (_ BitVec 8))))
  ((correct Bool) (pixelIn (_ BitVec 8))(xIn (_ BitVec 8))(yIn (_ BitVec 8))(pixelOut (_ BitVec 8)))
  (=> (not correct) (= (tweak pixelIn xIn yIn) pixelOut)))

(check-synth)
