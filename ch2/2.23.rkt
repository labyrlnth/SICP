(define (for-each func alist)
  (if (not(null? alist))
      (begin;begin will ensure that mutiple expressions will be executed as one(as 'if' requared)
        (func (car alist)) 
        (for-each func (cdr alist)))))