(define (accumulator base)
  (lambda(x)
    (begin (set! base (+ base x))
           base)))

(define A (accumulator 5))