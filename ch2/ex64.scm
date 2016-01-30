(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((= x (entry set)) #t)
        ((< x (entry set))
         (element-of-set? x (left-branch set)))
        ((> x (entry set))
         (element-of-set? x (right-branch set)))))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((< x (entry set))
         (make-tree (entry set)
                    (adjoin-set x (left-branch set))
                    (right-branch set)))
        ((> x (entry set))
         (make-tree (entry set)
                    (left-branch set)
                    (adjoin-set x (right-branch set))))))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))

; test it
(list->tree (list 1 3 5 7 9 11))
;=> (5 (1 () (3 () ())) (9 (7 () ()) (11 () ())))

;      5
;     / \
;    /   \
;   1     9
;    \   / \
;     3 7   11

; partial-tree makes a balanced tree out of the first n elements of elts, and
; returns two results in a cons pair: the constructed tree, and the rest of
; the elements in the list. If there are elements left, then the constructed
; tree will become the left branch of a new tree where the first element of
; the remaining elements will be the entry, and the partial-tree of the
; remaining elements after that will be the right branch of the final tree.

; The order of growth of list->tree for a list of n elements is O(n), because
; each time partial-tree is called, it creates a tree with one element as the
; entry, so partial-tree must be called n times, plus <2n times for the base
; cases at the leaves of the tree. O(n + 2n) is still O(n).

