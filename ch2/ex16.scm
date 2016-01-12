; I think the problem is that when you repeat an uncertain variable in a
; calculation, the system doesn't know that it's the same variable. You have
; some extra information, that that particular variable should have the same
; value in all the places it is used. But the interval-arithmetic system
; doesn't have this information, and treats them as two separate intervals.
; This results in the final answer being more uncertain than you expect.
;
; To solve this, the interval-arithmetic package would need to let you build
; expressions and specify which intervals represent the same value, and then
; it would have to do all the arithmetic calculations taking this information
; into account.
;
; I think it is possible, but indeed difficult.

