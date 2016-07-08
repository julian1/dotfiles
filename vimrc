
" fast mappings shift tab to change from insert to edit modes
" but makes tab completion in command shell wrong ?{{
" its better to use a rather i to avoid the cursor moving
" backward when toggling esc and insert mode
imap <S-Tab> <Esc><Esc>
cmap <S-Tab> <C-c>a
map <S-Tab> a



set number

" :nmap <C-U> :setlocal tabstop=4 shiftwidth=4 sts=4 expandtab<CR>
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab


set ruler
set report=0 " tell us when anything is changed via :...
set novisualbell " don't blink

" tab navigation like firefox
" this is stunningly good - use ctrl-n and ctrl-p since pg-up/down doesnt
" work
" just use ctrl-t to create new tab then :e file to open file
" likewise ctrl-w to close the tab
" but note
" #  CTRL+T is used for jumping to previous tags [exuberant ctags].
" # CTRL+W is used for jumping to next split window in multiple windows



""""" tabnext and tab previous defalts are gt and gT
"" not sure if shouldnt use defaults instead
" note that tabf is best way to open tab
:nmap <C-p> :tabprevious<cr>
:nmap <C-n> :tabnext<cr>
:map <C-p> :tabprevious<cr>
:map <C-n> :tabnext<cr>
:imap <C-p> <ESC>:tabprevious<cr>i
:imap <C-n> <ESC>:tabnext<cr>i

"If you are working with tags/cscope, <Ctrl-T> is used for popping the stack.
" note there is tabf <filename>
:nmap <C-t> :tabnew<cr>
:imap <C-t> <ESC>:tabnew<cr>
" C-W interferes with split navigation
":nmap <C-w> :tabclose<cr>
":imap <C-w> <ESC>:tabclose<cr>

" fast commenting of code - pretty basic
" note that the single , is slow because it has to resolve but if we hit
" any other key again then its fine

"" commas interfere with g; and g,  which iterate through change list
":map ,, :s/^/\/\//<CR><Esc>:nohlsearch<CR>
":map , :s/^\/\///<CR><Esc>:nohlsearch<CR>

set foldmethod=syntax
"   kk,aa aa  ,,,aa  " to reload vimrc - vimrc needs to be open
" :so %
"  sdfaaarearasd  asdfsf aafdasdf asdfsaafdsdfasdfasdfsdf i f df
"  ;asdfsdfsfdasd;j;sdfsdfsdfdfssdfsdfafdsdadfasfasdfsdffadfadfasdfsdffdssadfafisaf
" asdfasdf;
"
"
:noremap L 4l
:noremap H 4h
:noremap K 4k
":noremap J 4j

" spacebar control of tabs
" interferes with goto a character position
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zA')<CR>


" this is a really really nice mapping
" single press is 'i' and a single press and double is 'a' mode
" only thing is that it is kind of funny typing since it delays
" the i's that we type
" :imap ;; <esc>
" :map ;; a
" :cmap ;;  <C-c>a


" for vala
autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
" autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala            setfiletype vala
" au BufRead,BufNewFile *.vapi
"
" for objective c
au BufNewFile,BufRead *.m,*.h set ft=objc

"
syntax enable
"set background=light
"colorscheme solarized

" across the top
" Toggle list mode (show spaces/tabs)
:nmap <C-J> :set number!<CR>
:nmap <C-K> :set list!<CR>

" bash script formatting
" :nmap <C-I> :set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab<CR>

" ruby formatting
:nmap <C-O> :setlocal tabstop=2 shiftwidth=2 sts=2 expandtab<CR>

" ruby formatting
:nmap <C-I> :setlocal tabstop=4 shiftwidth=4 sts=4 expandtab<CR>



" fix all trailing space
:nmap <C-X> :%s/\s\+$//<CR>

" give buffer menu, and select choice
:nnoremap <C-M> :buffers<CR>:buffer<Space>

":verbose map <F5>


" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

au BufNewFile,BufRead *.sol setf solidity

au BufNewFile,BufRead *.why3 setf why3 
au BufNewFile,BufRead *.why setf why3 
au BufNewFile,BufRead *.mlw setf why3 



