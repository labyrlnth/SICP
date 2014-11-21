(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0) (/ trials-passed trials))
          ((experiment) (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

;Don't find a way to generate decimal random numbers
(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (* range (/ (random 100001) 100000)))))

(define square (lambda(x)(* x x)))

(define (estimate-integral pred x1 x2 y1 y2 trials)
  (define (experiment)
    (let ((x (random-in-range x1 x2))
          (y (random-in-range y1 y2)))
      (pred x y)))
  (* (monte-carlo trials experiment) 4.0))

(define (in-circle? x y)
  (<= (+ (square (- x 5)) (square (- y 7))) 9))

(define (estimate-pi trials)
  (exact->inexact (estimate-integral in-circle? 2 8 4 10 trials)))

(estimate-pi 10)
(estimate-pi 100)
(estimate-pi 1000)
(estimate-pi 10000)
(estimate-pi 100000)
(estimate-pi 1000000)
