#lang racket
;element-of-set? same

(define adjoin-set cons) ;O(1) instead of O(n)

(define (union-set set1 set2)(append set1 set2)) ;O(n) instead of O(n^2)

;intersection-set same