(define file1 (cons 'listfile (list (list "Alyssa P. Hacker" (cons 'rec1 (list "Alyssa P. Hacker" "alyssa@insat.io" 100000)))
                                    (list "Ben Bitdiddle" (cons 'rec2 (list "Ben Bitdiddle" 90000 "ben@insat.io"))))))
(define file2 (cons 'consfile (list (cons "George" (cons 'rec2 (list "George" 70000 "george@insat.io")))
                                    (cons "Martha" (cons 'rec1 (list "Martha" "martha@insat.io" 60000))))))

(define *op-table* (make-hash-table))
(define (put op type proc)
  (hash-table/put! *op-table* (list op type) proc))
(define (get op type)
  (hash-table/get *op-table* (list op type) #f))

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
        (apply proc (map contents args))
        (error
          "No method for these types -- APPLY-GENERIC"
          (list op type-tags))))))

(define (attach-tag type-tag contents)
  (cons type-tag contents))

(define (type-tag datum)
  (if (pair? datum)
      (car datum)
      (error "Bad tagged datum -- TYPE-TAG" datum)))

(define (contents datum)
  (if (pair? datum)
      (cdr datum)
      (error "Bad tagged datum -- CONTENTS" datum)))

(define (install-package)
  ; A listfile is a cons with the tag 'listfile as the car and a list of lists
  ; as the cdr. Each of those lists has the employee name as the first item and
  ; the employee's record as the second item.
  (define (get-record-listfile name file)
    (cond ((null? file) '())
          ((equal? name (caar file))
           (cadar file))
          (else
           (get-record-listfile name (cdr file)))))

  ; A consfile is a cons with the tag 'consfile as the car and a list of conses
  ; as the cdr. Each of those cons has the employee name as the car and the
  ; employee's record as the cdr.
  (define (get-record-consfile name file)
    (cond ((null? file) '())
          ((equal? name (caar file))
           (cdar file))
          (else
           (get-record-consfile name (cdr file)))))

  ; A rec1 is a cons with the tag 'rec1 as the car and a list of data as the
  ; cdr. The list of data contains the employee name, address, and salary in
  ; that order.
  (define (get-salary-rec1 record) (caddr record))

  ; A rec2 is a cons with the tag 'rec2 as the car and a list of data as the
  ; cdr. The list of data contains the employee name, salary and address in
  ; that order.
  (define (get-salary-rec2 record) (cadr record))

  (put 'get-record '(string listfile) get-record-listfile)
  (put 'get-record '(string consfile) get-record-consfile)
  (put 'get-salary '(rec1) get-salary-rec1)
  (put 'get-salary '(rec2) get-salary-rec2)

  'done)

(define (get-record name file)
  (apply-generic 'get-record (attach-tag 'string name) file))

(define (get-salary record)
  (apply-generic 'get-salary record))

(define (find-employee-record name files)
  (if (null? files)
      '()
      (let ((rec (get-record name (car files))))
        (if (null? rec)
            (find-employee-record name (cdr files))
            rec))))

(install-package)

; test it
(get-salary (get-record "Ben Bitdiddle" file1))
(get-salary (get-record "Martha" file2))
(find-employee-record "George" (list file1 file2))
(find-employee-record "Ben Bitdiddle" (list file1 file2))

; To add a new type of file and/or record to the system, just add a get-record/
; get-salary implementation for it inside install-package, and install it using
; put, and then it will just work.

