;; Old representation:
;(define (make-mobile left right)
;  (list left right))
;
;(define (make-branch length structure)
;  (list length structure))
;
;(define (left-branch mobile) (car mobile))
;(define (right-branch mobile) (cadr mobile))
;(define (branch-length branch) (car branch))
;(define (branch-structure branch) (cadr branch))

; New representation (only have to change the two "cadr" selectors):
(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (cdr mobile))
(define (branch-length branch) (car branch))
(define (branch-structure branch) (cdr branch))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(define (branch-weight branch)
  (if (pair? (branch-structure branch))
      (total-weight (branch-structure branch))
      (branch-structure branch)))

(define (branch-torque branch)
  (* (branch-length branch)
     (branch-weight branch)))

(define (balanced? mobile)
  (define (branch-balanced? branch)
    (if (pair? (branch-structure branch))
        (balanced? (branch-structure branch))
        #t))
  (and (= (branch-torque (left-branch mobile))
          (branch-torque (right-branch mobile)))
       (branch-balanced? (left-branch mobile))
       (branch-balanced? (right-branch mobile))))

; test it
(balanced? (make-mobile (make-branch 3 4) (make-branch 2 6)))
(balanced? (make-mobile (make-branch 3 4) (make-branch 2 5)))
(balanced? (make-mobile (make-branch 3 (make-mobile (make-branch 2 4) (make-branch 4 2))) (make-branch 2 9)))
(balanced? (make-mobile (make-branch 3 (make-mobile (make-branch 2 2) (make-branch 4 4))) (make-branch 2 9)))

