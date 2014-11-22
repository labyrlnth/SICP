(load "../commons/test-utils.rkt")

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

(assert (equal? result1 result3) "result1 equals to result2")
(assert (not (equal? result1 result2)) "result1 does not equal to result2")