(load "../commons/test-utils.rkt")

(define (obj-holder balance)
  (define (dispatch op amount)
    (cond ((eq? op 'deposit)
           (begin (set! balance (+ balance amount))
                  balance))
          ((eq? op 'withdraw)
           (if (>= balance amount)
               (begin (set! balance (- balance amount))
                      balance)
               "Insufficient funds"))))
  dispatch)

(define (make-account balance password)
  
  (if (number? balance)
        (set! balance (obj-holder balance)))
  
  ;local variable
  (define error-count 0)
  
  ;local proc
  (define (call-the-cops)
    (display "called-cops \n"))
  
  ;withdraw proc
  (define change-balance
    (lambda(op)
      (lambda(amount)
        (balance op amount))))
  
  ;join account proc
  (define (join new-pw)
    ;pass the balance object around
    (make-account balance new-pw))
  
  ;dispatch proc
  (define (dispatch pw op)
    (if (eq? pw password)
        (begin (set! error-count 0)
               (cond ((or (eq? op 'withdraw) (eq? op 'deposit)) 
                      (change-balance op))
                     ((eq? op 'join) join)
                     (else (error "Unknown request -- MAKE-ACCOUNT" op))))
        (begin (set! error-count (+ error-count 1))
               (if (>= error-count 7)
                   (lambda(x) (call-the-cops))
                   (lambda(x) "Incorrect password")))))
  dispatch)

(define (make-joint acc old-pw new-pw)
  ((acc old-pw 'join) new-pw))

(define alice-acc (make-account 100 'alice-pw))
(define bob-acc (make-joint alice-acc 'alice-pw 'bob-pw))

(assert (eq? ((alice-acc 'alice-pw 'deposit) 10) 110))
(assert (eq? ((bob-acc 'bob-pw 'deposit) 10) 120))
(assert (eq? ((alice-acc 'alice-pw 'withdraw) 20) 100))
(assert (eq? ((bob-acc 'bob-pw 'withdraw) 20) 80))

(assert (eq? ((alice-acc 'bob-pw 'withdraw) 20) "Incorrect password"))
(assert (eq? ((bob-acc 'alice-pw 'withdraw) 20) "Incorrect password"))




