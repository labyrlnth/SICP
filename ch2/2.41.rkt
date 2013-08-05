(define (enumerate-reverse n)
  (if (= n 1)(list n)
      (cons n (enumerate-reverse (- n 1)))))

;define a procedure that return all pair sum to n and (car n) than m
(define (make-pair n m)
  (define (helper n i m)
    (if (> i (- n i))
        (cons (list i (- n i))(helper n (- i 1) m))
        nil))
  (helper n m m))

(define (make-valid-triplets n nlist)
  (cond((null? nlist) nil)
       ((< (car(car nlist)) n)(cons(cons n (car nlist)) (make-valid-triplets n (cdr nlist))))
       (else (make-valid-triplets n (cdr nlist)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (sum-triplets n)
  (flatmap (lambda(x)(make-valid-triplets x (make-pair (- n x) n)))(enumerate-reverse n)))

;testcase
(sum-triplets 20)