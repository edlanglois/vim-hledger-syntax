if exists("b:current_syntax")
	finish
endif

syntax match csvrulesPattern '[^ \t].*$' contained nextgroup=csvrulesPattern skipnl
highlight link csvrulesPattern String

syntax keyword csvrulesIf if nextgroup=csvrulesPattern skipnl skipwhite
highlight link csvrulesIf Conditional

syntax region csvrulesDateFormat start="[^ \t]" end="$" contained
highlight link csvrulesDateFormat Constant
syntax keyword csvrulesKeyword date-format nextgroup=csvrulesDateFormat skipwhite

syntax region csvrulesIncludeFile start="[^ \t]" skip="\\ " end="\s" end="$" contained
highlight link csvrulesIncludeFile String
syntax keyword csvrulesKeyword include nextgroup=csvrulesIncludeFile skipwhite

syntax keyword csvrulesKeyword skip separator end newest-first
highlight link csvrulesKeyword Keyword

syntax match csvrulesComment "#.*$"
highlight link csvrulesComment Comment

syntax match csvrulesNumber "\v<[-+]?\d+(\.\d*)?>"
highlight link csvrulesNumber Number

syntax keyword csvrulesStandardFieldName date date2 status code description comment contained
syntax match csvrulesStandardFieldName "\v<account[1-9](-(in|out))?>" contained
syntax match csvrulesStandardFieldName "\v<amount[1-9]?(-(in|out))?>" contained
syntax match csvrulesStandardFieldName "\v<currency[1-9]?>" contained
syntax match csvrulesStandardFieldName "\v<balance[1-9]>" contained
highlight link csvrulesStandardFieldName Identifier

syntax match csvrulesCustomFieldName "\v<\i+>" contained
highlight link csvrulesCustomFieldName Identifier

syntax cluster csvrulesFieldName contains=csvrulesStandardFieldName,csvrulesCustomFieldName

syntax region csvrulesFields start="" end="$" contained contains=@csvrulesFieldName
syntax keyword csvrulesKeyword fields nextgroup=csvrulesFields skipwhite

syntax match csvrulesReference "%" nextgroup=@csvrulesFieldName contained
highlight link csvrulesReference Identifier

syntax region csvrulesFieldValue start="" end="$" contained contains=csvrulesReference
syntax match csvrulesAssignField "\v^\s*<\i+>" nextgroup=csvrulesFieldValue skipwhite
highlight link csvrulesAssignField Identifier

let b:current_syntax = "csv-rules"
