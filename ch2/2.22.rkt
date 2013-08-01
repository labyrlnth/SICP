;the first won't work because the items are popped
;from the first list and pushed into the second one,
;thus cause order-reversing.

;the second one won't work because cons a list to a int
;results in a list in list ((1 2) 3), but cons a int to a list
;results in a single list (1 2 3)