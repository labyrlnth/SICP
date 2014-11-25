#lang r5rs
(#%provide (all-defined));workaround to load files in r5rs

(define (error reason . args)
  (display "Error: ")
  (display reason)
  (for-each (lambda (arg) 
              (display " ")
              (write arg))
            args)
  (newline)
  (scheme-report-environment -1)) ;; we hope that this will signal an error


(define out
  (lambda items
    (for-each
      (lambda (x)
           (display x)
           (newline))
      items)))