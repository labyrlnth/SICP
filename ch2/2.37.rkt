;given
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map (lambda(x) (car x)) seqs))
            (accumulate-n op init (map (lambda(x) (cdr x)) seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda(x)(dot-product x v)) m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda(x) (matrix-*-vector cols x)) m)))

;test case
(define matrix (list(list 1 2 3 4)(list 4 5 6 6)(list 6 7 8 9)))
(define vector (list 1 2 3 4))
(define matrix1 (list(list 1 2)(list 3 4)))
(define matrix2 (list(list 5 6)(list 7 8)))

(define test1 (matrix-*-vector matrix vector))
(define test2 (transpose matrix))
(define test3 (matrix-*-matrix matrix1 matrix2))
