(define (adjoin-position new-row k rest-of-queens)
  (cons (list k new-row) rest-of-queens))

(define (abs n) (if (>= n 0) n (- 0 n)))

(define (enumerate-interval i j)
  (cond ((= i j)(list i))
        ((> i j) nil)
        (else(cons i (enumerate-interval (+ i 1) j)))))

;here i omit the paramiter k because the kth is alway on the left
(define (safe? positions)
  (define (safe-helper? list1 list2)
    (if (or (= (car list1)(car list2)) 
            (= (cadr list1)(cadr list2))
            (= (abs(- (car list1)(car list2)))(abs(- (cadr list1)(cadr list2)))))
        #f
        #t))
  (if(null? (cdr positions))
     #t
     (and (safe-helper? (car positions)(cadr positions))(safe? (cons (car positions)(cdr(cdr positions)))))))

(define (filter predicate sequence)
  (cond((null? sequence) nil)
       ((predicate (car sequence))
        (cons (car sequence)
              (filter predicate (cdr sequence))))
       (else (filter predicate (cdr sequence)))))

(define empty-board (list))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))


(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions)(safe? positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))