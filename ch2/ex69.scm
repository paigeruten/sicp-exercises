(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch
               (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit -- CHOOSE-BRANCH" bit))))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (cond ((and (leaf? tree)
              (eq? (symbol-leaf tree) symbol))
         '())
        ((leaf? tree)
         (error "symbol not in tree -- ENCODE-SYMBOL" symbol))
        ((memq symbol (symbols (left-branch tree)))
         (cons 0 (encode-symbol symbol (left-branch tree))))
        ((memq symbol (symbols (right-branch tree)))
         (cons 1 (encode-symbol symbol (right-branch tree))))
        (else
         (error "symbol not in tree -- ENCODE-SYMBOL" symbol))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)
                               (cadr pair))
                    (make-leaf-set (cdr pairs))))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge trees)
  (cond ((null? trees) (error "nothing to merge -- SUCCESSIVE-MERGE"))
        ((null? (cdr trees)) (car trees))
        (else
         (successive-merge
           (adjoin-set (make-code-tree (car trees) (cadr trees))
                       (cddr trees))))))

; test it
(define huffman-tree (generate-huffman-tree '((A 8) (B 3) (C 1) (D 1) (E 1) (F 1) (G 1) (H 1))))
huffman-tree
(define message (encode '(B A C A D A E A F A B B A A A G A H) huffman-tree))
message
(length message)

; The message is 42 bits long, exactly the same as the example at the start of
; 2.3.4, even though the bit string is quite different. (Actually, many
; sections of the bit string are the same, with the main differences being some
; long strings of 0's are now long strings of 1's, and vice-versa.)

