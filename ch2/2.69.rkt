(load "2.67.rkt")

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x)(weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)
                               (cadr pair))
                    (make-leaf-set (cdr pairs))))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge pairs)
  (if (= (length pairs) 1) 
       (car pairs)
       (successive-merge (adjoin-set (make-code-tree (car pairs) (cadr pairs))
                                     (cddr pairs)))))

;test

;(generate-huffman-tree '((A 8) (B 3) (C 1) (D 1) (E 1) (F 1) (G 1) (H 1)))

;(                                             (leaf A 8)
; ((((leaf H 1)
;    (leaf G 1) (H G) 2)
;   ((leaf F 1)
;    (leaf E 1) (F E) 2) (H G F E) 4)
;  (((leaf D 1) 
;    (leaf C 1) (D C) 2) 
;             (leaf B 3)   (D C B) 5)  (H G F E D C B) 9) (A H G F E D C B) 17)
