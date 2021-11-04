"prueba de fugitive
"instalacion de plugins"
call plug#begin('~/.vim/plugged')

"autocompletado de distintos lenguajes para vim"
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"integrar git a vim"
Plug 'tpope/vim-fugitive'
"muestra lineas de indentado"
Plug 'yggdroot/indentline'
"resaltado de sintaxis"
Plug 'sheerun/vim-polyglot'

Plug 'jiangmiao/auto-pairs'

Plug 'glepnir/oceanic-material'
"todos los buffers aparecen abajo con sus respectivos números"
Plug 'bling/vim-bufferline'
"instala nerdtree, una especie de explorador de archivos para vim"
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"pone colores a las parejas de parentesis para verlos mas facilmente"
Plug 'junegunn/rainbow_parentheses.vim' 
"buscador difuso
Plug 'junegunn/fzf'
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
set relativenumber "el número de las demás lineas es relativo a la actual"
set encoding=Utf-8
set title  " Muestra el nombre del archivo en la ventana de la terminal
colorscheme rigel 
set cursorline  " Resalta la línea actual
set colorcolumn=220  " Muestra la columna límite a 120 caracteres
set tabstop=4 " Indentación a 2 espacios
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab  " Insertar espacios en lugar de <Tab>s
set hidden  " Permitir cambiar de buffers sin tener que guardarlos
set ignorecase  " Ignorar mayúsculas al hacer una búsqueda
set smartcase  " No ignorar mayúsculas si la palabra a buscar contiene mayúsculas

set spelllang=en,es  " Corregir palabras usando diccionarios en inglés y español
set ruler
set syntax=on 
set termguicolors  " Activa true colors en la terminal
set guifont=DroidSansMono_Nerd_Font:h11

let NERDTreeQuitOpen=1  "al abrir un archivo con nerdtree, este se cierra"
let mapleader='-'
let g:gruvbox_constrast_dark = "hard"
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
let g:airline_theme='simple'"
let g:rainbow_active = 1


filetype plugin on

"FUNCIONES

function Commit()

  call inputsave()
  let cometer = input('Desea guardar los cambios en git? Y/y/N/n: ')
  let mensaje= input('Mensaje: ')
  call inputrestore()  

  if cometer=="Y" || cometer=="y" 
    
    :Git commit <c-r>=mensaje <cr> <cr>

  else
    echo "Operación cancelada"

  endif

endfunction

function Initialize()

  call inputsave()
  let init = input('desea inicializar un proyecto en git? Y/y/N/n: ')
  call inputrestore()  

  if init=="Y" || init=="y" 

    :Git init
    echo "Inicializado"

  else
    
    echo "Operación cancelada"

  endif

endfunction

function Pushear()

  call inputsave()
  let push = input('desea guardar el proyecto en git? Y/y/N/n: ')
  call inputrestore()  

  if push=="Y" || push=="y" 

    call inputsave()
    let l:branch = input('En que rama desea guardarlo?')
    call inputrestore()  

    :Git push <C-R>=branch <CR> <CR>

  else
    
    echo "Operación cancelada"

  endif


endfunction

function Add()
  
  call inputsave()
  let add=input('File name / Folder name / % for current file/: ')
  call inputrestore()

  :execute 'Git add '. add


endfunction


"mapeos de nerdtree
nmap <Leader>n :NERDTreeToggle<CR>   
nmap <Leader>m :NERDTreeToggle<cr>:NERDTreeCWD<CR>

"remapeos"
nmap <Leader>s :so %
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>b :buffers<CR>
nmap <F6> :term python % <CR>
nmap <Tab> :bn<CR>
nmap <Leader>t :term % <CR>
nmap <F3> :q!<CR>
nmap <F2> :wq!<CR>
nmap <Leader>v :vsp <CR>
nmap <Leader>d :bd<CR>
nmap <Leader>- :bp<CR>
nmap <Leader>c :cd ~<CR>
nmap <F5> :edit ~\AppData\Local\nvim\init.vim<CR>
nmap <Leader>a :let hello='hola'<CR> :echo <c-r>=hello <CR>

"mapeos de vimplug
nmap <Leader>pi :PlugInstall<CR>
nmap <Leader>pc :PlugClean<CR>

"mapeos de fugitive
nmap <Leader>gp :call Pushear()<CR>
nmap <Leader>gc :call Commit()<CR> 
nmap <Leader>ga :call Add()<CR>
nmap <Leader>gl :Git log<CR>
nmap <Leader>gs :Git status<CR>
nmap <Leader>gi :call Initialize()<CR>

"mapeos de fzf
nmap <Leader>f :FZF<cr>

"comandos que se ejecutan automaticamente"
:autocmd vimenter * silent! :RainbowParentheses
:autocmd bufenter * silent! :cd %:p:h


