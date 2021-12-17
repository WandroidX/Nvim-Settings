"NOTA: Ctags debe ser agregado a PATH y la ruta de python3 o 2 en una variable llamada g:python3_host_prog. Para los plugins se requiere de Git instalado en la pc. Para CoC se requiere NodeJs instalado en la pc. La variable $PATH en el archivo es para la preview de fzf

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
"tema para vim
Plug 'glepnir/oceanic-material'
"todos los buffers aparecen abajo con sus respectivos números"
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


" ajustes de vim

color rigel "esquema de color para el editor
"esto es para cambiar los colores de la linea resaltada. color= gris
hi CursorLine gui=none guibg=#222222
" esto es para cambiar los colores del resaltado de las busquedas
hi Search guibg=gold  guifg=black
" cambiar el fondo del editor a un azul oscuro
hi normal guibg=#000010 
" cambiar la linea actual
hi cursorlinenr guibg=#222222 guifg=gold
"cambiar los demás costados de linea
hi linenr guibg=#000010 guifg=white
"cambiar el color de los comentarios
hi comment guifg=#0F52BA
"cambiar color de los parentesis al poner el cursor sobre ellos
hi matchparen guifg=black guibg=green
"cambia el color de los types en vim. ej: matchparen y comment  y de import y
"from en python
hi type guifg=00FFFF
"cambia el color de los nombres de funciones
hi function guifg=#3FFF00	
"cambia el color de las declaraciones como if, as, def, return en python a
"gris
hi statement guifg=#708090	 
"cambia el color de los caracteres especiales, como \\ y \n en python
hi special guifg=#FFD700	
"cambia el color de los strings a color JADE
hi string guifg=#00A86B	
"cambia el color de los números
hi number guifg=#E52B50
"cambia el color de los condicionales
hi conditional guifg=#FF6600	
"cambia el color de palabras clave, como while y for
hi keyword guifg=#ff00ff 
"cambia el color de los operadores. ej: =, +, in, etc
hi operator guifg=#FF7F50	  



set autochdir "cambia automaticamente el directorio de trabajo al directorio del buffer actual"
set autoread "para que lea automaticamente los archivos
set number "habilita la numeracion
set mouse=a "permite que se pueda usar el mouse"
set clipboard=unnamed "permite copiar al portapapeles y pegar desde este"
set numberwidth=1
set relativenumber "el número de las demás lineas es relativo a la actual"
set encoding=utf-8 "para que el editor pueda abrir archivos con carácteres no normales
set title  " muestra el nombre del archivo en la ventana de la terminal
set cursorline  " resalta la línea actual
set colorcolumn=220  " muestra la columna límite a 120 caracteres
set tabstop=4 " indentación a 2 espacios
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab  " insertar espacios en lugar de <tab>s
set hidden  " permitir cambiar de buffers sin tener que guardarlos
set ignorecase  " ignorar mayúsculas al hacer una búsqueda
set smartcase  " no ignorar mayúsculas si la palabra a buscar contiene mayúsculas
set spelllang=en,es  " corregir palabras usando diccionarios en inglés y español
set ruler
set syntax=on " pone color a la sintaxis
set termguicolors  " activa true colors en la terminal
set complete+=k~/desktop/html.txt "aqui puedo poner un archivo para autocompletar



"configuracion de ctags
"necesario para evitar errores al generar las etiquetas con ctags. aqui va la ruta en la que se encuentra su ejecutable
let g:tagbar_ctags_bin='c:\ProgramData\chocolatey\bin\ctags.exe'

"configuracion de airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1 "permite usar fuente parcheada para dar estilo a airline como powerline. requiere fuente parcheada instalada en pc
let g:airline_theme='simple' "tema de airline

let g:airline#extensions#nerdtree_statusline = 1

" configuracion de fzf 

"NOTA: para activar la preview de fzf es necesario añadir 
"'C:\Program\Files\Git\usr\bin' a la variable de entorno PATH
"
let g:fzf_preview_window = ['right:50%'] "configura la preview de fzf
let g:fzf_layout = { 'down': '~70%' } "permite configurar lo que ocupa fzf en pantalla

"configuracion de easyescape
let g:easyescape_chars = { "j": 2 } "caracteres que sustituyen a escape
let g:easyescape_timeout = 50 "tiempo de espera de los caracteres

"configuracion de ultisnips

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


"configuracion de python
let g:python3_host_prog='c:\\python310\\python.exe' "aqui se debe poner la ruta del ejecutable de python3


" configuracion de rainbow paretheses
let g:rainbow_active = 1 "activa los parentesis de colores

filetype plugin on

"funciones

"this function allows me with leader+c commit to git the added previously
function Commit()
call inputsave()
let cometer = input('Desea guardar los cambios en git? Y/y/N/n: ')
let mensaje= input('Mensaje: ')
call inputrestore()  
if cometer=="Y" || cometer=="y" 
:execute 'Git commit -m '.'"'. mensaje.'"'
else
echo "Operación cancelada"
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
echo "Operación cancelada"
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
echo "Operación cancelada"
endif
endfunction

function Remote()
call inputsave()
let l:link=input('Enlace del repositorio: ')
call inputrestore()
if link==''
echo 'No debe estar vacio'
endif
:execute 'Git remote add origin '.link
endfunction

function Add()
call inputsave()
let add=input('File name / Folder name / % for current file/: ')
call inputrestore()
:execute 'Git add '. add
endfunction





"mapeos

"jj ahora es escape en modo insertar
imap jj <esc>
"al presionar escape dos veces en modo normal, quita el resaltado de las busquedas
nnoremap <esc><esc> :nohlsearch<cr>
"esto hace que espacio no haga nada en modo normal. necesario para que espacio
"sea el 'mapleader'
nnoremap <space> <Nop> 
"<leader> es espacio
let mapleader=' '

" esto es para que se apliquen los cambios a vim sin tener que reiniciar
nmap <Leader>s :so %<CR>
" esto es para guardar los cambios en los archivos
nmap <Leader>w :w<CR>
" esto es para salir de vim forsozamente
nmap <Leader>q :q!<CR>
" esto es para dividir la pantalla verticalmente
nmap <Leader>v :vsp <CR>
"esto es para ir al siguiente búfer
nmap <Leader>c :cd ~<CR>
"esto es para abrir la terminal con el archivo actual como argumento
nmap <Leader>t :term % <CR>
"esto es para abrir la terminal de python con el archivo actual como argumento
nmap <F6> :term python % <CR>
"esto es para guardar y salir de vim
nmap <F2> :wq!<CR>
"esto es para abrir ej archivo init.vim, donde se cambian las configuraciones
"del editor
nmap <F5> :e $MYVIMRC<cr>

"bufers
nmap <Tab> :bn<CR>
" esto es para eliminar el búfer actual
nmap <Leader><space> :bp<CR>
"esto es para abrir la ruta de mi usuario
nmap <Leader>d :bd<CR>
"esto es para ir al bufer anterior al actual

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

nmap <Leader>f :Files<CR>
nmap <Leader>l :Lines<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>T :Tags<CR>
nmap <leader>r :Rg<CR>


"mapeos de nerdtree

"este hace que se muestre nerdtree
nmap <Leader>n :NERDTree<cr>
"este es para abrir nerdtree y que vaya a la ruta actual
nmap <Leader>m :NERDTreeCWD<CR>

"etiquetas

" llevarme a la etiqueta con el nombre de la palabra bajo el cursor
nmap <Leader>t :execute 'tag ' . expand('<cword>')<cr>





"comandos que se ejecutan automaticamente"

"activar el coloreado de parentesis, porque no se activa automaticamente
:autocmd vimenter * silent! :RainbowParentheses :cd %:p:h  
" al entrar a archivos html, mapear en modo normal la tecla leader + h para
" abrir refresh.py (archivo creado por mí para abrir html y refrescar el
" navegador al cambiar este archivo) con la ruta absoluta del archivo actual
" como parámetro
:autocmd bufenter *.html :nmap <Leader>h :silent execute 'term python "c:\users\crist\downloads\creative_projects\python\automate_scripts\refresh.py" ' . expand('%:p') <cr>
" al salir de un bufer de html, unmapear leader + h para evitar errores con el
" script
:autocmd bufleave *.html :unmap <Leader>h
" generar etiquetas al guardar un archivo
:autocmd bufwrite * :!ctags -R %

let g:Tlist_Ctags_Cmd='c:\ProgramData\chocolatey\bin\ctags.exe'
"necesario para evitar errores al generar las etiquetas con ctags. aqui va la ruta en la que se encuentra su ejecutable
let g:tagbar_ctags_bin='c:\ProgramData\chocolatey\bin\ctags.exe'
