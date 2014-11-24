#lang racket

(define (make-account balance password)
  
  ;local variable
  (define error-count 0)
  
  ;local proc
  (define (call-the-cops)
    (display "called-cops \n"))
  
  ;withdraw proc
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  
  ;deposit proc
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  
  ;dispatch proc
  (define (dispatch pw op)
    (if (eq? pw password)
        (begin (set! error-count 0)
               (cond ((eq? op 'withdraw) withdraw)
                     ((eq? op 'deposit) deposit)
                     (else (error "Unknown request -- MAKE-ACCOUNT" op))))
        (begin (set! error-count (+ error-count 1))
               (if (>= error-count 7)
                   (lambda(x) (call-the-cops))
                   (lambda(x) (begin (display "Incorrect password \n")))))))
  dispatch)

(define acc (make-account 100 'secret-password))

(let loop ((try 0))
  (if (< try 10)
    (begin
      ((acc 'wrong-passwd 'withdraw) 10)
      (loop (+ try 1)))
    'done))

((acc 'secret-password 'withdraw) 10);90
((acc 'secret-password 'deposit) 100);90