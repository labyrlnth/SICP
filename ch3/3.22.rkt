#lang r5rs
(#%require "../commons/utils.rkt")

(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    
    ;;internal proc      
    (define (empty?)
      (null? front-ptr))
    
    (define (front)
      (if (empty?)
          (error "FRONT called with an empty queue")
      (car front-ptr)))
    
    (define (insert! i)
      (let ((p (cons i '())))
        (cond ((empty?)
               (set! front-ptr p)
               (set! rear-ptr p))
              (else
               (set-cdr! rear-ptr p)
               (set! rear-ptr p)))))
    
    (define (delete!)
      (cond ((empty?)
             (error "DELETE! called with an empty queue"))
            (else
             (set! front-ptr (cdr front-ptr)))))
    
    (define (dispatch m)
      (cond ((eq? m 'front-ptr) front-ptr)
            ((eq? m 'empty?) (empty?))
            ((eq? m 'front) (front))
            ((eq? m 'insert!) insert!)
            ((eq? m 'delete!) (delete!))
            (else (error "unknown operation"))))
    
  dispatch))

;3.22
(define (printq queue)
  (display (queue 'front-ptr))
  (newline))

;make a empty queue
(define q1 (make-queue))
(printq q1)

;empty-queue?
(out (q1 'empty?))

((q1 'insert!) 'a)
(printq q1)

((q1 'insert!) 'b)
(printq q1)

;empty-queue?
(out (q1 'empty?))

(q1 'delete!)
(printq q1)

(q1 'delete!)
(printq q1)
