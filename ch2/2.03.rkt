(define (make-rect l w)(cons l w))
(define (rect-length rect)(car rect))
(define (rect-width rect)(cdr rect))
(define (rect-area rect)(* (rect-length rect) (rect-width rect)))
(define (rect-perimeter rect)(* 2 (+ (rect-length rect)(rect-width rect))))
  
(define rect_test (make-rect 3 4))
