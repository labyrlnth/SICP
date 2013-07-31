(define (cons x y)
  (* (expt 2 x)
     (expt 3 y)))

(define (car a)
  (if (= (remainder a 2) 0)
      (+ 1 (car (/ a 2)))
      0))

(define (cdr a)
  (if (= (remainder a 3) 0)
      (+ 1 (cdr (/ a 3)))
      0))