" Display a prompt and get a single-character response from the user
" msg: String       The message to display at the prompt
" choicestr: String A string of characters, each of which is a separate valid
"                   response
"
" A hint of the form (x/y/.../z) where x, y, etc are the valid character
" responses, will be appended automatically to the end of the prompt.
"
" Returns: the selected character
" Example: echo Prompt("Do you want to continue?", "yn")
"   (shows "Do you want to continue? (y/n)")
"   (returns either y or n)
" Bugs: accepts certain regex chars such as . ^ $
function! Prompt(msg, choicestr)
    let l:choices = split(a:choicestr, '\zs')   " \zs => match at any position
    let l:prompt = a:msg . ' (' . join(l:choices, '/') . ')'
    echohl Question | echon l:prompt | echohl Normal
    while 1
        let l:ans = nr2char(getchar())
        if match(l:choices, l:ans) >= 0
            redraw          " avoids 'press enter to continue'
            return l:ans
        endif
    endwhile
endfunction
