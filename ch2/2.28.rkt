(define (fringe tree)
  (cond((null? tree) nil)
       ((not(pair? tree)) (list tree))
       (else (append(fringe(car tree))(fringe(cdr tree))))))

;test case  
(define x(list(list 1 2)(list 3 4)))
(define y(list 1 2 3 4))
(define z(list (list 1 (list 2 3 4 5)) (list 6 7) (list 8 9)))