(define (split first-transform second-transform)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split first-transform sencond-transform) painter (- n 1))))
          (first-transform painter (second-transform smaller smaller))))))

