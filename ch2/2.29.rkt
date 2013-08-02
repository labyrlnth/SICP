;given
(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))

;a)
(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (car(cdr mobile)))
(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (car(cdr branch)))

;b)
(define (total-weight mobile)
  (if(not(pair? mobile))
     mobile
     (+ (total-weight(branch-structure(left-branch mobile))) (total-weight(branch-structure(right-branch mobile))))))
;c)
(define(balance? mobile)
  (cond((not(pair? mobile)) #t)
       (else(and(balance? (branch-structure(left-branch mobile)))
                (balance? (branch-structure(right-branch mobile)))
                (= (*(branch-length(left-branch mobile))
                     (total-weight(branch-structure(left-branch mobile))))
                   (*(branch-length(right-branch mobile))
                     (total-weight(branch-structure(right-branch mobile)))))))))


;test case
;            |
;      ___2__|__3__
;  _3_|_4__        |
; |        |       11
; 4        3

(define x 
  (make-mobile 
   (make-branch 2 (make-mobile(make-branch 3 4)(make-branch 4 3)))
   (make-branch 3 11)))
