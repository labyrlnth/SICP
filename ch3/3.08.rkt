#lang racket

(define f
  (let ((a -1))
    (lambda(x)
      (if (eq? a -1)
          (begin (set! a x) x)
          (begin (set! a -1) 0)))))

(+ (f 1)(f 0))
(+ (f 0)(f 1))
