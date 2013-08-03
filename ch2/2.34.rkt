;given
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeeff higher-terms) (+ this-coeeff (* x higher-terms)))
              0
              coefficient-sequence))
;test case(79)
(horner-eval 2 (list 1 3 0 5 0 1))