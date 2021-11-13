"prueba de fugitive
"instalacion de plugins"
call plug#begin('~/.vim/plugged')


"snippets para vim
Plug 'SirVer/ultisnips'
"motor de snippets
Plug 'honza/vim-snippets'
"para ayudarme a salir de modo insertar mas rapido 
Plug 'zhou13/vim-easyescape'
"instalar ctags, generador de etiquetas. i will use it to goto fuctions
"definitiion
Plug 'webastien/vim-ctags'
"autocompletado de distintos lenguajes para vim"
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"integrar git a vim"
Plug 'tpope/vim-fugitive'
"muestra lineas de indentado"
Plug 'yggdroot/indentline'
"resaltado de sintaxis"
Plug 'sheerun/vim-polyglot'

"pone parentesis automaticamente
Plug 'jiangmiao/auto-pairs'

Plug 'glepnir/oceanic-material'
"todos los buffers aparecen abajo con sus respectivos n�meros"
Plug 'bling/vim-bufferline'
"instala nerdtree, una especie de explorador de archivos para vim"
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"pone colores a las parejas de parentesis para verlos mas facilmente"
Plug 'junegunn/rainbow_parentheses.vim' 
"buscador difuso
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"tema de color de vim"
Plug 'Rigellute/rigel'
"me permite comentar presionando leader+cc"
Plug 'preservim/nerdcommenter'
"agrega iconos de carpetas y tipos de archivos"
Plug 'ryanoasis/vim-devicons'
"me permite moverme entre tabs con ctrl+hjkl"
Plug 'christoomey/vim-tmux-navigator'
"agrega linea con datos de archivos, linea,modo, etc"
Plug 'vim-airline/vim-airline'
"temas para vim airline"
Plug 'vim-airline/vim-airline-themes'

call plug#end()


set number "habilita la numeracion
set mouse=a "permite que se pueda usar el mouse"
set clipboard=unnamed "permite copiar al portapapeles y pegar desde este"
set numberwidth=1
set relativenumber "el n�mero de las dem�s lineas es relativo a la actual"
set encoding=Utf-8
set title  " Muestra el nombre del archivo en la ventana de la terminal
colorscheme rigel 
set cursorline  " Resalta la l�nea actual
set colorcolumn=220  " Muestra la columna l�mite a 120 caracteres
set tabstop=4 " Indentaci�n a 2 espacios
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab  " Insertar espacios en lugar de <Tab>s
set hidden  " Permitir cambiar de buffers sin tener que guardarlos
set ignorecase  " Ignorar may�sculas al hacer una b�squeda
set smartcase  " No ignorar may�sculas si la palabra a buscar contiene may�sculas


let $PATH = "C:\\Program Files\\Git\\usr\\bin;" . $PATH
set spelllang=en,es  " Corregir palabras usando diccionarios en ingl�s y espa�ol
set ruler
set syntax=on " pone color a la sintaxis
set termguicolors  " Activa true colors en la terminal
set guifont=DroidSansMono_Nerd_Font:h11
set complete+=k~/desktop/html.txt "aqui puedo poner un archivo para autocompletar

let NERDTreeQuitOpen=1  "al abrir un archivo con nerdtree, este se cierra"

let g:gruvbox_constrast_dark = "hard"

"airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1 "permite usar fuente parcheada para dar estilo a airline como powerline
let g:airline_theme='simple' "tema de airline
let g:rainbow_active = 1 "activa los parentesis de colores

"fzf settings
let g:fzf_preview_window = ['right:50%'] "configura la preview de fzf
let g:fzf_layout = { 'down': '~70%' } "permite configurar lo que ocupa fzf en pantalla

"easyescape settings
let g:easyescape_chars = { "j": 2 } "caracteres que sustituyen a escape
let g:easyescape_timeout = 50 "tiempo de espera de los caracteres


let g:python3_host_prog='c:\\Python310\\python.exe' "aqui se debe poner la ruta del ejecutable de python3



filetype plugin on

"FUNCIONES

"this function allows me with leader+c commit to git the added previously
function Commit()
  call inputsave()
  let cometer = input('Desea guardar los cambios en git? Y/y/N/n: ')
  let mensaje= input('Mensaje: ')
  call inputrestore()  
  if cometer=="Y" || cometer=="y" 
    :execute 'Git commit -m '.'"'. mensaje.'"'
  else
    echo "Operaci�n cancelada"
  endif
endfunction




"this function allows me initialize a repository 
function Initialize()
  call inputsave()
  let init = input('desea inicializar un proyecto en git? Y/y/N/n: ')
  call inputrestore()  
  if init=="Y" || init=="y" 
    :Git init
    echo "Inicializado"
  else
    echo "Operaci�n cancelada"
  endif
endfunction

"this function allow me 
function Pushear()
  call inputsave()
  let l:push = input('desea guardar el proyecto en git? Y/y/N/n: ')
  call inputrestore()  
  if push=="Y" || push=="y" 
    call inputsave()
    let l:branch = input('En que rama desea guardarlo? ')
    call inputrestore()  
    :execute 'Git push -u origin '. branch 
  else
    echo "Operaci�n cancelada"
  endif
endfunction

function Remote()
  call inputsave()
  let l:link=input('Enlace del repositorio: ')
  call inputrestore()
  if link=''
    echo 'No debe estar vacio'
  :execute 'Git remote add origin '.link
endfunction
function Add()
  call inputsave()
  let add=input('File name / Folder name / % for current file/: ')
  call inputrestore()
  :execute 'Git add '. add
endfunction

"jj ahora es escape en modo insertar
imap jj <esc>
"espacio no hace nada en modo normal
nnoremap <space> <Nop> 
"<leader> es espacio
let mapleader=' '
"mapeos de nerdtree
nmap <Leader>n :NERDTreeToggle<CR>   
nmap <Leader>m :NERDTreeToggle<cr> :NERDTreeCWD<CR>


" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


"remapeos"
nmap <Leader>s :so %<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q!<CR>
nmap <Leader>v :vsp <CR>
nmap <Leader>d :bd<CR>
nmap <Leader><Tab> :bp<CR>
nmap <Leader>c :cd ~<CR>
nmap <Leader>t :term % <CR>
nmap <F3> :q!<CR>
nmap <F6> :term python % <CR>
nmap <F2> :wq!<CR>
nmap <F5> :edit ~\AppData\Local\nvim\init.vim<CR>
nmap <Tab> :bn<CR>

"mapeos de vimplug
nmap <Leader>pi :PlugInstall<CR>
nmap <Leader>pc :PlugClean<CR>

"mapeos de fugitive
nmap <Leader>gp :call Pushear()<CR>
nmap <Leader>gc :call Commit()<CR> 
nmap <Leader>ga :call Add()<CR>
nmap <Leader>gl :Git log<CR>
nmap <Leader>gs :Git status<CR>
nmap <Leader>gr :call Remote()<CR>
nmap <Leader>gi :call Initialize()<CR>

"mapeos de fzf
nmap <Leader>f :Files<cr>
nmap <Leader>l :Lines<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>T :Tags<CR>

"etiquetas
nmap <Leader>t :execute 'tag ' . expand('<cword>') . expand('')
set autochdir "cambia automaticamente el directorio de trabajo al directorio del buffer actual"







"comandos que se ejecutan automaticamente"
:autocmd vimenter * silent! :RainbowParentheses
:autocmd vimenter *.html,.py,.bat,.css,.js,.ps1 silent! :cd %:p:h | :!ctags -R .
:autocmd bufwrite * :!ctags -R %

let g:tagbar_ctags_bin = 'C:\ProgramData\chocolatey\bin\ctags.exe' "aqui va la ruta de ctags, y debe ser agregada a PATH





