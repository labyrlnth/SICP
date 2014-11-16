(define (equal? list1 list2)
  (cond ((and (null? list1)(null? list2)) true)
        ((or (null? list1)(null? list2)) false)
        ((eq? (car list1)(car list2)) (equal? (cdr list1)(cdr list2)))
        (else false)))

;test
(equal? '()'())
(equal? '()'(1))
(equal? '(1)'(1))
(equal? '(1)'(1 2))
(equal? '(1 3)'(1 2))