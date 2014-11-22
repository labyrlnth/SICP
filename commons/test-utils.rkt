(define (assert bool . reason)
  (if bool
      "assert succeeded"
      (if (null? reason)
          (error "assert failed.")
          (error "assert failed: " (car reason)))))