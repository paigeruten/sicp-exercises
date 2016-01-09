(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

; Before, with square, we were halving the work we had to do by recursing with
; exp / 2. But here we are doubling the halved work by recursing twice, which
; makes the function a O(n) process. It's doing precisely the same amount of
; work a naive expt function that doesn't do successive squaring would do.

