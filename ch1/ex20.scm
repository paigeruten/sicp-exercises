(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(gcd 206 40)
; Normal-order evaluation:
; (gcd 206 40)
; (if (= 40 0)
;     206
;     (gcd 40 (remainder 206 40)))
; (gcd 40 (remainder 206 40))
; (if (= (remainder 206 40) 0)
;     40
;     (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
; [1 remainder operation performed so far.]
; (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
; (if (= (remainder 40 (remainder 206 40)) 0)
;     (remainder 206 40)
;     (gcd (remainder 40 (remainder 206 40))
;          (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
; [3 remainder operations performed so far.]
; (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
; (if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
;     (remainder 40 (remainder 206 40))
;     (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;          (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
; [7 remainder operations performed so far.]
; (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;      (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
; (if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
;     (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;     (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;          (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;                     (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
; [14 remainder operations performed so far, and we've hit b=0.]
; (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
; [16 remainder operations performed so far.]
; (remainder 6 (remainder 40 6))
; [17 remainder operations performed so far.]
; (remainder 6 4)
; [18 remainder operations performed in total.]
; 2

; Applicative-order evaluation:
; (gcd 206 40)
; (if (= 40 0) 206 (gcd 40 (remainder 206 40)))
; (gcd 40 (remainder 206 40))
; [1 remainder operation performed so far.]
; (gcd 40 6)
; (if (= 6 0) 40 (gcd 6 (remainder 40 6)))
; (gcd 6 (remainder 40 6))
; [2 remainder operations performed so far.]
; (gcd 6 4)
; (if (= 4 0) 6 (gcd 4 (remainder 6 4)))
; (gcd 4 (remainder 6 4))
; [3 remainder operations performed so far.]
; (gcd 4 2)
; (if (= 2 0) 4 (gcd 2 (remainder 4 2)))
; (gcd 2 (remainder 4 2))
; [4 remainder operations performed in total.]
; (gcd 2 0)
; (if (= 0 0) 2 (gcd 0 (remainder 2 0)))
; 2

