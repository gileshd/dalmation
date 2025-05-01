syn region FCall matchgroup=FName start='[[:alpha:]_]\i*\s*(' end=')' contains=FCall,FCallKeyword
syn match FCallKeyword /\i*\ze\s*=[^=]/ contained
hi link FCallKeyword pythonOperator
hi FName ctermfg=blue
hi link pythonImport Statement
