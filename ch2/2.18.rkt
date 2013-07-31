(define (reverse list)
  (define (reverse-helper ori dst)
    (if (null? ori)
        dst
        (reverse-helper (cdr ori) (cons (car ori) dst))))
  (reverse-helper list nil))
      
  
