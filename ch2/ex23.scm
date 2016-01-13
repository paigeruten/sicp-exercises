(define (for-each proc items)
  (if (null? items)
      #t
      (let ((ignored (proc (car items))))
        (for-each proc (cdr items)))))

; test it
(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))

