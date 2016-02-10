; (a) Numbers and symbols aren't tagged with a type the way sums and products
;     are. Sums and products are lists with either a '+ symbol or a '* symbol
;     at the front. The operator function simply takes the car of a sum or
;     product to get the operation symbol. To have numbers and symbols be
;     handled by the dispatch, the operator and operands functions would have
;     to do number? and variable? tests and return a special symbol for those
;     cases, which could work.

(define put 2d-put!)
(define get 2d-get)

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp)) (operands exp)
                                           var))))

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (operator exp) (car exp))

(define (operands exp) (cdr exp))

; (b)
(define (install-deriv-package)
  (define (deriv-sum operands var)
    (make-sum (deriv (car operands) var)
              (deriv (cadr operands) var)))

  (define (deriv-product operands var)
    (make-sum
      (make-product (car operands)
                    (deriv (cadr operands) var))
      (make-product (deriv (car operands) var)
                    (cadr operands))))

  ; (c)
  (define (deriv-exponentiation operands var)
    (make-product (cadr operands)
                  (make-exponentiation (car operands)
                                       (make-sum (cadr operands)
                                                 -1))))

  (put 'deriv '+ deriv-sum)
  (put 'deriv '* deriv-product)
  (put 'deriv '** deriv-exponentiation)

  'done)

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))

(define (make-exponentiation base exp)
  (cond ((=number? exp 0) 1)
        ((=number? exp 1) base)
        ((and (number? base) (number? exp)) (expt base exp))
        (else (list '** base exp))))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(install-deriv-package)

; test it
(deriv '(+ (* a (** x 2)) (* b x) c) 'x)
(deriv '(** x 10) 'x)
(deriv '(** x 1) 'x)

; (d) The only change required would be to swap the two arguments in the put
;     calls, when installing the package.

