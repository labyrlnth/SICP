#lang racket
(define (make-monitored proc)
  (define count 0)
  (lambda(x)
    (cond ((number? x) 
           (begin (set! count (+ count 1))
                              (proc x)))
          ((eq? x 'how-many-calls?) count)
          ((eq? x 'reset-count) (set! count 0))
          (else (error "unknown request" x)))))

(define s (make-monitored sqrt))