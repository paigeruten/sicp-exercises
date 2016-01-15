(car ''abracadabra)
;=> quote

; 'abracadabra is syntax sugar for (quote abracadabra), so ''abracadabra is
; syntax sugar for (quote (quote abracadabra)), which evaluates to the list
; (list 'quote 'abracadabra). The car of this list is the symbol 'quote.

