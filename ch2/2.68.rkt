(load "2.59.rkt") ;element-of-set?
(load "2.67.rkt")

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (cond ((not (element-of-set? symbol (symbols tree))) (error "Invalid symbol"))
        ((leaf? tree) '())
        ((element-of-set? symbol (symbols (left-branch tree)))
         (cons 0 (encode-symbol symbol (left-branch tree))))
        ((element-of-set? symbol (symbols (right-branch tree)))
         (cons 1 (encode-symbol symbol (right-branch tree))))))

;(encode '(A D A B B C A) sample-tree)
;(0 1 1 0 0 1 0 1 0 1 1 1 0)
