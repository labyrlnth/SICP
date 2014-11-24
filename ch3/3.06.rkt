#lang racket

(define rand
  (let ((x 0))
    (define (dispatch message)
      (cond ((eq? message 'generate)
             (begin (set! x (+ x 1))
                    x))
            ((eq? message 'reset)
             (lambda(new-value)(set! x new-value)))))
  dispatch))

(define (generate-numbers count)
  (if (= count 0)
      '()
      (cons (rand 'generate)
            (generate-numbers (- count 1)))))

(define result1 (generate-numbers 10))
(define result2 (generate-numbers 10))
((rand 'reset) 0)
(define result3 (generate-numbers 10))

(equal? result1 result3);#t
(equal? result1 result2);#f