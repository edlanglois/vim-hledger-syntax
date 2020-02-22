if exists("b:current_syntax")
	finish
endif

syntax match patternComment ';.*$'
highlight link patternComment Comment

syntax match patternDate '\v^(\d{4}[-/.])?\d{2}[-/.]\d{2}' nextgroup=patternDateSep,patternTransactionStatus,patternTransactionCode,patternDescription
highlight link patternDate Constant

syntax match patternDateSep '=' contained nextgroup=patternDate2
highlight link patternDateSep Operator

syntax match patternDate2 '\v(\d{4}[-/.])?\d{2}[-/.]\d{2}' contained nextgroup=patternTransactionStatus,patternTransactionCode,patternDescription
highlight link patternDate2 Constant

syntax match patternDescription '\v\s+[^;]*' contained
highlight link patternDescription String

syntax match patternTransactionCode '\v\s+\(\S+\)' contained nextgroup=patternDescription
highlight link patternTransactionCode Identifier

syntax match patternTransactionStatus '\v\s+!' contained nextgroup=patternTransactionCode,patternDescription
syntax match patternTransactionStatus '\v\s+\*' contained nextgroup=patternTransactionCode,patternDescription
highlight link patternTransactionStatus Operator

syntax match patternPostingStart '\v^\s+' nextgroup=patternPostingStatus,patternAccount

syntax match patternPostingStatus '\v!\s+' contained nextgroup=patternAccount
syntax match patternPostingStatus '\v\*\s+' contained nextgroup=patternAccount
highlight link patternPostingStatus Operator

syntax match patternAccount '\v\S+( \S+)*' contained nextgroup=patternAmountMinus,patternAmountType1,patternAmountQuantity1 skipwhite

syntax match patternAmountType1 '\v[^-0-9 \t]+' contained nextgroup=patternAmountQuantity2 skipwhite
syntax match patternAmountType1 '\v"[^"]*"' contained nextgroup=patternAmountQuantity2 skipwhite
highlight link patternAmountType1 Type

syntax match patternAmountType2 '\v[^-0-9 \t]+' contained nextgroup=patternAssertionEq,patternAmountPriceAt skipwhite
syntax match patternAmountType2 '\v"[^"]*"' contained nextgroup=patternAssertionEq,patternAmountPriceAt skipwhite
highlight link patternAmountType2 Type

syntax match patternAmountMinus '-' contained nextgroup=patternAmountType1
highlight link patternAmountMinus Number

syntax match patternAmountQuantity1 '\v-?\d+([ ,.]\d+)*(\.\d+)?' contained nextgroup=patternAmountType2,patternAssertionEq,patternAmountPriceAt skipwhite
highlight link patternAmountQuantity1 Number

syntax match patternAmountQuantity2 '\v-?\d+([ ,.]\d+)*(\.\d+)?' contained nextgroup=patternAssertionEq,patternAmountPriceAt skipwhite
highlight link patternAmountQuantity2 Number

syntax match patternAmountPriceAt '\v\@\@?' contained nextgroup=patternAmountMinus,patternAmountType1,patternAmountQuantity1 skipwhite
highlight link patternAmountPriceAt Operator

syntax match patternAssertionEq '\v\=\=?\*?' contained nextgroup=patternAssertionMinus,patternAssertionType1,patternAssertionQuantity1 skipwhite
highlight link patternAssertionEq Operator

syntax match patternAssertionType1 '\v[^-0-9 \t]+' contained nextgroup=patternAssertionQuantity2 skipwhite
syntax match patternAssertionType1 '\v"[^"]*"' contained nextgroup=patternAssertionQuantity2 skipwhite
highlight link patternAssertionType1 Type

syntax match patternAssertionType2 '\v[^-0-9 \t]+' contained nextgroup=patternAssertionEq skipwhite
syntax match patternAssertionType2 '\v"[^"]*"' contained nextgroup=patternAssertionEq skipwhite
highlight link patternAssertionType2 Type

syntax match patternAssertionMinus '-' contained nextgroup=patternAssertionType1
highlight link patternAssertionMinus Number

syntax match patternAssertionQuantity1 '\v-?\d+([ ,.]\d+)*(\.\d+)?' contained nextgroup=patternAssertionType2,patternAssertionEq skipwhite
highlight link patternAssertionQuantity1 Number

syntax match patternAssertionQuantity2 '\v-?\d+([ ,.]\d+)*(\.\d+)?' contained nextgroup=patternAssertionEq skipwhite
highlight link patternAssertionQuantity2 Number

let b:current_syntax = "journal"
