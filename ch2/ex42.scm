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
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

; test it
(queens 8)

