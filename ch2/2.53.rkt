(list 'a 'b 'c)  ;(a b c)
(list (list 'george))  ;((george))
(cdr '((x1 x2)(y1 y2)))  ;((y1 y2))
(cadr '((x1 x2)(y1 y2)))  ;(y1 y2) the first item of the rest list
(pair? (car '(a short list)))  ;#f the result of cons
(memq 'red '((red shoes)(blue socks)))  ;f
(memq 'red '(red shoes blue socks))  ;(red shoes blue socks