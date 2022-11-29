set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Modules
source ~/.config/nvim/modules/neovide.vim
source ~/.config/nvim/modules/plugs.vim
source ~/.config/nvim/modules/start-up.vim

" Other
autocmd FileType json syntax match Comment +\/\/.\+$+
set foldlevel=99
set foldmethod=syntax
set splitbelow
set splitright

" Keybindings
" ==gi means to go back to insert mode.
" inoremap is used for insert move, nnoremap is for normal mode.
" <CR> is the Return key.
inoremap <A-Down> <Esc>:m .+1<CR>==gi " Move the selected line down.
inoremap <A-Up> <Esc>:m .-2<CR>==gi " Move the selected line up.
inoremap <silent> <A-y> <Esc>:redo<CR>==gi
inoremap <silent> <A-z> <Esc>:undo<CR>==gi
nnoremap <silent> <C-Q> :bd<CR> " Close selected buffer.
nnoremap <silent> <C-s> :w<CR> " Save the current file.
nnoremap <silent> <C-z> za<CR> " Toggle folds.
nnoremap <silent> <esc> :noh<esc> " Remove highlighting from search.
nnoremap <silent> <C-Left> :tabprevious<CR> " Go to previous tab.
nnoremap <silent> <C-Right> :tabnext<CR> " Go to next tab.
nnoremap <silent> <A-t> :tabnew<CR> " Open a new tab.

" Open multiple files as tabs by default
augroup open-tabs
    au!
    " tab all: set everything to tabs.
    " tabfirst: focus on first tab.
    au VimEnter * ++nested if !&diff | tab all | tabfirst | endif
augroup end

" WinMove
" I'm not sure how this works, I got it from some website.
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction
nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>
