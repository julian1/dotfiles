" deployed by ansible!

" :inoremap <C-i>   <ESC>
" *********** TOGGLE INSERT/MODE **************** " Must use the Ctrl otherwise it will screw up copy and paste into buffer,
" i to insert, ii to escape
" inoremap ii <Esc>   " ii key is <Esc> setting

"ctrl-i is a lot easier than ctrl-c since uses two hands and is symetrical with i for insert mode


" avoid creating backup files... still does undo, and swap
" set nobackup nowritebackup


" *********** MISC ****************

" disable mouse, which interferes with copy/paste from terminal
:set mouse=

" start in number mode
set number

" don't blink
set novisualbell


" don't do auto commenting , better copy pasting
set paste



" tell us when anything is changed via :...
set report=0

" need doc on all other keys
" C u - up
" C d - down
" C j - join lower line with current line
" C i - seems not to be overloadable as interferes with tab expansion
" C n	next tab
" C p	prev tab
" C m	buffer menu

" this is really nice for fast navigating, duplicates existing keys
":noremap <C-L> 4l
":noremap <C-H> 4h
":noremap <C-K> 4k
":noremap <C-J> 4j



" put any selected text into the command line on ':'
" https://stackoverflow.com/questions/4878980/vim-insert-selected-text-into-command-line
" prevents easy sedding on, git rebase -i
"vnoremap : y:<C-r>"<C-b>


" shortcut to fix all trailing space
:noremap <C-x> :%s/\s\+$//<CR>

" provide buffer menu, to select buffer
:nnoremap <C-m> :buffers<CR>:buffer<Space>

" TODO should consolidate under ctrl character
" Toggle numbers in lhs margin
:noremap <c-j> :set number!<CR>

" toggle display of formatting characters
:noremap <c-k> :set list!<CR>


" ctrl i to escape edit mode - actually pretty nice
" but screws up tab expansion, for some reason.
":inoremap <C-I>  <C-c>

" save session,
":mksession ~/mysession.vim

" open with same session
" vim -S ~/mysession.vim


function! SaveSession()
  !rm -f ./mysession.vim
  :mksession ./mysession.vim
endfunction
nmap <C-Y> mz:execute SaveSession()<CR>



" to reload vimrc - vimrc needs to be open
" :so %
" :so ~/.vimrc





" *********** TABS ****************
" tab navigation like firefox
" works very well - use ctrl-n and ctrl-p correspond to :bn and :bp - for next and previous buffervim
" just use ctrl-t to create new tab then :e file to open file
" likewise ctrl-w to close the tab
" but note
" # CTRL+T is used for jumping to previous tags [exuberant ctags].
" # CTRL+W is used for jumping to next split window in multiple windows
""""" tabnext and tab previous defalts are gt and gT
"" not sure if shouldnt use defaults instead
" note that tabf is best way to open tab
:nmap <C-p>     :tabprevious<cr>
:map <C-p>      :tabprevious<cr>
:imap <C-p>     <ESC>:tabprevious<cr>i

:nmap <C-n>     :tabnext<cr>
:map <C-n>      :tabnext<cr>
:imap <C-n>     <ESC>:tabnext<cr>i

"If you are working with tags/cscope, <Ctrl-T> is used for popping the stack.
" note there is tabf <filename>
:nmap <C-t>     :tabnew<cr>
:imap <C-t>     <ESC>:tabnew<cr>
:imap <C-t>     <ESC>:tabnew<cr>

" C-W interferes with split navigation
" might be better with tab close
:nmap <C-w>     :q<cr>
:map <C-w>      :q<cr>
:imap <C-w>     <ESC>:q<cr>i



" tab key cycles buffers. eg. useful to cycle buffers in a tab
" nnoremap  <silent>   <tab>  :bnext<CR>
" nnoremap  <silent> <s-tab>  :bprevious<CR>



" ********** FOLDING **************

" set foldmethod=syntax

" set to unfold 5 levels, so a newly opened file is mostly unfolded
" see, http://vim.wikia.com/wiki/All_folds_open_when_opening_a_file
" set foldlevelstart=5

" ************** TAB/SPACE HANDLING ****************

" defaults
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab


function! TabToggle()
  if &tabstop==2
    set tabstop=4
    set shiftwidth=4
    set sts=4
    set expandtab
    echo "tabstop=4, expand tab"
  elseif &tabstop==4 && &expandtab
    set tabstop=4
    set shiftwidth=4
    set sts=4
    set noexpandtab
    echo "tabstop=4, no expand tab"
  else
    set tabstop=2
    set shiftwidth=2
    set sts=2
    set expandtab
    echo "tabstop=2, expand tab"
  endif
endfunction

:noremap <C-l> mz:execute TabToggle()<CR>
"nmap <C-o> mz:execute TabToggle()<CR>
"map <C-o> mz:execute TabToggle()<CR>
"imap <C-o> mz:execute TabToggle()<CR>

" *************** SYNTAX HIGHLIGHTING *******

" shouldn't need this, as autodetect should work
" au BufNewFile,BufRead *.why3 setf why3
" au BufNewFile,BufRead *.why setf why3
" au BufNewFile,BufRead *.mlw setf why3


" *************** LOCALIZE TMP FILE HANDLING *******
" ie keep *.swp, *.swo, files out of edit directories
" http://stackoverflow.com/questions/743150/how-to-prevent-vim-from-creating-and-leaving-temporary-files
" note swp file is useful, for telling us when the file is already open in another vim session

set backupdir=$HOME/.vim/backup//
set directory=$HOME/.vim/swap//
set undodir=$HOME/.vim/undo//

" https://vi.stackexchange.com/questions/21708/how-do-i-disable-vim-from-producing-backup-files
" create dirs if necessary
"if !isdirectory(&undodir)   | call mkdir(&undodir, "p") | endif
"if !isdirectory(&backupdir) | call mkdir(&backupdir, "p") | endif
"if !isdirectory(&directory) | call mkdir(&directory, "p") | endif


" autoload and bundle also
"if !isdirectory('~/.vim/autoload//')  | call mkdir('~/.vim/autoload//', "p") | endif
"if !isdirectory('~/.vim/bundle//')    | call mkdir('~/.vim/bundle//', "p") | endif



" idris specific?
let hs_highlight_delimiters = 1
let hs_highlight_boolean = 1
let hs_highlight_types = 1
let hs_highlight_more_types = 1
let hs_highlight_debug = 1
let hs_allow_hash_operator = 1



" enable syntax highlyging
syntax enable
" set background=light
" good for dark bg
" colorscheme koehler

" peachpuff
colorscheme default


" http://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work
" Allow saving of files as sudo when I forgot to start vim using sudo.
"cmap wx w !sudo tee > /dev/null %
cmap wx w !sudo tee  %

" do this last, something is turning ruler off...
" ruler at lower rhs, reporting position in file
set ruler



" verilog no longer auto detected? jan 2024
autocmd BufNewFile,BufRead *.v set filetype=verilog

" au BufReadPost *.v set syntax=verilog



" *************** PATHOGEN *******

" execute pathogen#infect()

" autodetect if have pathogen before load
runtime autoload/pathogen.vim
if exists('g:loaded_pathogen')
    call pathogen#infect()  "load the bundles, if possible
    Helptags                "plus any bundled help
endif


" jun 2024. suppress keyword completion - in insert mode
" https://stackoverflow.com/questions/63275538/how-to-disable-vim-built-in-keyword-autocompletion
" none of these work
" :set complete=
" inoremap <c-p> <nop>
" inoremap <c-n> <nop>
" But ctrl-e with clear the pop-up menu, and go back to regular text insert mode.






