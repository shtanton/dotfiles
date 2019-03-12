function! case#splitCamel(text) abort
	return _case_splitCamel(a:text)
endfunction

function! case#joinCamel(text) abort
	return _case_joinCamel(a:text)
endfunction

function! case#splitSnake(text) abort
	return _case_splitSnake(a:text)
endfunction

function! case#joinSnake(text) abort
	return _case_joinSnake(a:text)
endfunction


function! case#camel(text) abort
	return case#joinCamel(case#splitSnake(a:text))
endfunction
