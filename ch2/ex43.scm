(define (enumerate-interval low high)
  (if (> low high)
    ()
    (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (fold-right append () (map proc seq)))

(define empty-board ())

; Store queen positions as a list of row numbers.
(define (adjoin-position new-row k rest-of-queens)
  (cons new-row rest-of-queens))

(define (safe? k positions)
  (define (iter new-queen i pos)
    (cond ((null? pos) #t)
          ((= new-queen (car pos)) #f) ; check for same row
          ((= (abs (- new-queen (car pos))) i) #f) ; check for same diagonal
          (else (iter new-queen (+ i 1) (cdr pos)))))

  (iter (car positions) 1 (cdr positions)))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
      (list empty-board)
      (filter
        (lambda (positions) (safe? k positions))
        (flatmap
          (lambda (new-row)
            (map (lambda (rest-of-queens)
                   (adjoin-position new-row k rest-of-queens))
                 (queen-cols (- k 1))))
        (enumerate-interval 1 board-size)))))
  (queen-cols board-size))

; This indeed runs very slowly. (queens 6) runs in less than a second still,
; but (queens 7) takes about 10 seconds, and (queens 8) takes more than a
; minute (I gave up waiting after a minute).
;
; The reason it is so much slower is that (queen-cols (- k 1)) is being called
; 8 times instead of once, for every call of queen-cols when k > 0. So
; (queen-cols 7) is called 8 times, (queen-cols 6) is called 64 times,
; (queen-cols 6) is called 8^3 times, etc., until (queen-cols 0) is called
; 8^9 times, which is over 100 million times.
;
; The original solution only calls (queen-cols (- k 1)) 8 times. So I think
; the slow solution will take 8^8 * T time to solve the puzzle, if the
; original solution takes time T.
(queens 8)

