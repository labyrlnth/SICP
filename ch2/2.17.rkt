(define(last-pair list)
  (if (null? (cdr list))
      (cons (car list) nil)
      (last-pair (cdr list))))
      
  
