"vimBundle"""""""""""""""""""""""""""""""""
 set nocompatible               " Be iMproved

 if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 call neobundle#rc(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 NeoBundleFetch 'Shougo/neobundle.vim'

 " Recommended to install
 " After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
 NeoBundle 'Shougo/vimproc'

 " My Bundles here:
 "
 " Note: You don't set neobundle setting in .gvimrc!
 " Original repos on github
 " vim-scripts repos
 NeoBundle 'gregsexton/MatchTag'
 NeoBundle 'violetyk/cake.vim'
 NeoBundle 'Shougo/neocomplcache'
 NeoBundle 'Shougo/neosnippet'
 NeoBundle 'vim-scripts/taglist.vim'
 NeoBundle 'Shougo/unite.vim'
 NeoBundle 'kchmck/vim-coffee-script'
 NeoBundle 'Lokaltog/vim-easymotion'
 NeoBundle 'digitaltoad/vim-jade'
 NeoBundle 'pangloss/vim-javascript.git'
 NeoBundle 'wavded/vim-stylus'
 NeoBundle 'tpope/vim-surround.git'
 NeoBundle 'mattn/zencoding-vim'
 NeoBundle 'Shougo/vimfiler'

 NeoBundle 'majutsushi/tagbar'
 NeoBundle 'tpope/vim-haml'
 NeoBundle 'cakebaker/scss-syntax.vim'
 NeoBundle 'tpope/vim-rails'
 NeoBundle 'basyura/unite-rails'


 " Non github repos
 "NeoBundle 'git://git.wincent.com/command-t.git'
 "NeoBundle 'https://gist.github.com/762326.git'
 
 " Non git repos
 "NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
 "NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'

filetype plugin indent on
NeoBundleCheck



"Basic設定"""""""""""""""""""""""""""""""""""""""
syntax on
":colorscheme elflord
":colorscheme delek
":colorscheme ap_dark8
set autoindent
set showmatch
set hidden
set incsearch
"set list
"set listchars=eol:$,tab:>\ ,extends:<
set listchars=extends:<

highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
au BufRead,BufNew * match JpSpace /　/

highlight Whitespace cterm=underline ctermfg=darkgray guifg=darkgray
"match Whitespace /\s/
autocmd BufRead,BufNew * match Whitespace / /
set number
set tabstop=2
set shiftwidth=2
set smartindent
set smarttab
set ignorecase
set smartcase
set hlsearch
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set backspace=indent,eol,start
"以下３行swpファイルの保存場所を指定する
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

set tags+=.tags;
call pathogen#infect()


"htmlで対応するタグに%でジャンプ
"runtime macros/matchit.vim

"ファイル・タイプを独自に関連付ける"""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.scss set filetype=css

"独自短縮入力"""""""""""""""""""""""""""""""""""""""
iab YDT <C-R>=strftime("%Y-%m-%d %T")<CR>
"iab fe foreach as $k => $v{<CR><TAB><CR><UP><UP><ESC>e<SPACE>i
"iab for for($i = 0;$i<=n;$i++){<CR><TAB>}
"iab pe <?php echo ;?><LEFT><LEFT><LEFT>
imap ,cm <!----><LEFT><LEFT><LEFT>
"map ,, i<pre><CR><TAB>var_dump(<ESC>pa);<CR></pre><ESC>Bbbve
"ab ,, i<pre><CR><TAB>var_dump($);<CR></pre><ESC>Bb<Right>a
"inoremap { {}<LEFT>

inoremap [<TAB> []<LEFT>
inoremap [<TAB><TAB> [""]<LEFT><LEFT>
inoremap [[<TAB> [][]<LEFT><LEFT><LEFT>
inoremap [[<TAB><TAB> [""][""]<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
inoremap =<TAB> <Space>=<Space>
nnoremap <CR> i<CR><UP><ESC>
map ,y :'s,'ey<CR>
map ,d :'s,'ed<CR>
nnoremap ,q <ESC>:bd<CR>
inoremap <C-O> <ESC>o
inoremap <C-W> <ESC>:w
"nnoremap <C-W> <ESC>:w
inoremap <C-s> <ESC>:w
nnoremap <C-s> <ESC>:w
inoremap <C-CR> <ESC>:bn<CR>

smap  <BS> <BS>i
smap  <CR> <BS>
nnoremap ,sp <ESC>:set paste<CR>i
nnoremap ,snp <ESC>:set nopaste<CR>

"inoremap 11 !
"inoremap 22 "
"inoremap 33 #
"inoremap 44 $
"inoremap 55 %
"inoremap 66 &
inoremap 2<Tab> ""<Left>
inoremap 7<Tab> ''<Left>
inoremap 8<TAB> ()<Left>
inoremap {<TAB> {<CR><CR>}<UP>
"日付の入力補助
"inoremap <expr> ,df strftime('%Y-%m-%d %H:%M:%S')
"inoremap <expr> ,dd strftime('%Y-%m-%d')
"inoremap <expr> ,dt strftime('%H:%M:%S')

" neocomplcache(new version)""""""""""""""""""""""""""""""""""""
"--------------------------------------------------------------------------
" neocomplcache
let g:neocomplcache_enable_at_startup = 1

" ユーザー定義スニペット保存ディレクトリ
let g:neocomplcache_snippets_dir = $HOME.'/.vim/snippets'
nmap ,sni :NeoSnippetEdit

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"--------------------------------------------------------------------------
" neosnippet

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

let g:neocomplcache_auto_completion_start_length = 1


" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
let g:neosnippet#snippets_directory='~/.vim/snippets'

"unite.vim""""""""""""""""""""""""""""""""""""""""""""""""""
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable =1
"let g:unite_enable_start_insert = 1
" バッファ一覧
"nnoremap ;; :<C-u>Unite buffer -direction=botright -auto-resize -toggle<CR>
nnoremap ;; :<C-u>Unite buffer -direction=botright -auto-resize -toggle<CR>

" 全部乗せ
"nnoremap :: :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file -direction=botright -toggle<CR>
nnoremap :: :<C-u>UniteWithBufferDir -buffer-name=files buffer bookmark file -direction=botright -toggle<CR>

nnoremap ;: :<C-u>Unite file_mru<CR>
"ヤンク履歴
nnoremap <C-u><C-y> :Unite -buffer-name=register register<CR>

"vim-javascript""""""""""""""""""""""""""""""""""""""""""""""""""
"https://github.com/pangloss/vim-javascript
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"


"easy-motion""""""""""""""""""""""""""""""""""""""""""""""""""
"http://blog.remora.cx/2012/08/vim-easymotion.html
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 「'」 + 何かにマッピング
let g:EasyMotion_leader_key="<SPACE>"
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue


"vimfiler""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimfiler_as_default_explorer = 1


" Auto compile .haml files on save, but only
" if there's a .autocompilehaml file in the cwd.
" Depends on a `haml` executable. `sudo gem install haml`

au BufWritePost *.haml call HamlMake()

function! HamlMake()
    py << ENDOFPYTHON
import os
import vim

in_file = vim.current.buffer.name
dirname = os.path.dirname(in_file)
if os.path.exists(dirname + "/.autohaml"):
    out_file = in_file[0:-5] + ".html"
    os.system("haml %s > %s" % (in_file, out_file))

ENDOFPYTHON
endfunction


"unite-rails""""""""""""""""""""""""""""""""""""""""""""""""""
noremap ,c :<C-u>Unite rails/controller<CR>
noremap ,rc :<C-u>Unite rails/controller<CR>
noremap ,m :<C-u>Unite rails/model<CR>
noremap ,rm :<C-u>Unite rails/model<CR>
noremap ,v :<C-u>Unite rails/view<CR>
noremap ,rv :<C-u>Unite rails/view<CR>
noremap ,h :<C-u>Unite rails/helper<CR>
noremap ,j :<C-u>Unite rails/javascript<CR>
noremap ,rj :<C-u>Unite rails/javascript<CR>
noremap ,s :<C-u>Unite rails/stylesheet<CR>
noremap ,rs :<C-u>Unite rails/stylesheet<CR>
noremap ,cf :<C-u>Unite rails/config<CR>


"taglist""""""""""""""""""""""""""""""""""""""""""""""""""
"set tags = tags
"let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Ctags_Cmd = "/usr/local/Cellar/ctags/5.8/bin/ctags"
let Tlist_Show_One_File = 1 "現在表示中のファイルのみのタグしか表示しない
let Tlist_Use_Right_Window = 1                    " 右側にtag listのウインドうを表示する
let Tlist_Exit_OnlyWindow = 1                      " taglistのウインドウだけならVimを閉じる
"map <silent> <leader>l :TlistToggle<CR>  "\lでtaglistウインドウを開いたり閉じたり出来るショートカット
map ,t <Esc>:TlistToggle<CR><C-W><C-W>


"coffe-script""""""""""""""""""""""""""""""""""""""""""""""""""

"let coffee_compile_vert = 1
"nnoremap ,cc <ESC>:CoffeeCompile vert<CR>
nnoremap ,cc <ESC>:CoffeeCompile vert <CR><C-w><C-W>
nnoremap ,ccc <ESC><C-w><C-W>:bd <CR>
