(define (reverse list)
  (define (reverse-helper ori dst)
    (cond ((null? ori) dst)
          ((not (pair? ori)) ori)
          (else(reverse-helper (cdr ori) (cons (car ori) dst)))))
  (reverse-helper list nil))

(define (deep-reverse list)
  (if(not(pair? list))
     list
     (reverse (map deep-reverse list))))

;test case
(define x(list(list 1 2)(list 3 4)))
(define y(list 1 2 3 4))
(define z(list (list 1 (list 2 3 4 5)) (list 6 7) (list 8 9)))