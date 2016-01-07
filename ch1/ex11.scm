; recursive process
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

; test it
(f 0)
(f 1)
(f 2)
(f 3)
(f 4)
(f 5)
(f 10)

; iterative process
(define (f n)
   (define (f-iter a b c count)
      (if (= count 0)
          c
          (f-iter (+ a (* 2 b) (* 3 c))
                  a
                  b
                  (- count 1))))

   (f-iter 2 1 0 n))

; test it
(f 0)
(f 1)
(f 2)
(f 3)
(f 4)
(f 5)
(f 10)

