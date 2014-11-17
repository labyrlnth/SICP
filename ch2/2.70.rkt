(load "2.68.rkt") ;encode
(load "2.69.rkt") ;generate-huffman-tree

(define message '(GET A JOB 
                      SHA NA NA NA NA NA NA NA NA
                      GET A JOB
                      SHA NA NA NA NA NA NA NA NA
                      WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP
                      SHA BOOM))

(define tree (generate-huffman-tree '((A 2)(NA 16)(BOOM 1)(SHA 3)(GET 2)(YIP 9)(JOB 2)(WAH 1))))
(define code (encode message tree))


;(1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0
; 0 0 0 0 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 0 1 1 0 1 1)

;length: 84
;If using fixed-length encoding, each symbol would take at least 3 bit, and the length of 
;the message is 36, the total length would be 3 * 36 = 108