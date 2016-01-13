(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

(define first-denomination car)
(define except-first-denomination cdr)
(define no-more? null?)

(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

; test it
(cc 100 us-coins)
(cc 100 (reverse us-coins))
(cc 45 uk-coins)
(cc 45 (reverse uk-coins))

; The order of the coin-values doesn't affect the final answer of cc, but it
; does make cc run noticeably slower when the order of coin-values is reversed
; to be in ascending order. This is because in descending order we subtract a
; large denomination from amount early on, breaking the problem down into more
; equally-sized parts to minimize the amount of exponential recursion that is
; needed to solve the whole problem.

