call plug#begin('~/.vim/plugged')

"lualine"
Plug 'nvim-lualine/lualine.nvim'
"bufferline"
Plug 'noib3/nvim-cokeline'
"Sirve para mejorar el comando 'f' y 'F' en vim"
Plug 'https://github.com/justinmk/vim-sneak'
"Iconos para neovim
Plug 'kyazdani42/nvim-web-devicons' " If you want devicons
"tema de color de vim"
Plug 'dracula/vim'
"indentline
Plug 'lukas-reineke/indent-blankline.nvim'
" file explorer"
Plug 'kyazdani42/nvim-tree.lua'
" telescope fzf"
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
"sirve para administrar proyectos - junto con telescope"
Plug 'https://github.com/ahmedkhalf/project.nvim'

Plug 'https://github.com/tpope/vim-surround'

"snippets para vim
"vim snippets"
Plug 'https://github.com/honza/vim-snippets'
"ultisnips"
Plug 'SirVer/ultisnips'
"para ayudarme a salir de modo insertar mas rapido 
Plug 'zhou13/vim-easyescape'
"integrar git a vim"
Plug 'tpope/vim-fugitive'
"añade los íconos de diff al archivo que estoy editando"
Plug 'https://github.com/airblade/vim-gitgutter'
"resaltado de sintaxis"
Plug 'sheerun/vim-polyglot'
"tema para vim
"pone colores a las parejas de parentesis para verlos mas facilmente"
Plug 'junegunn/rainbow_parentheses.vim' 
"me permite comentar presionando leader+cc"
Plug 'preservim/nerdcommenter'
"permite moverse entre pestañas con ctrl + direccion vimniana"
Plug 'christoomey/vim-tmux-navigator'

"estos son plugins cmp, para autocompletado mediante los servidores lsp"
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
"sirve para hacer debugging 
Plug 'https://github.com/puremourning/vimspector'
"redimensiona los split al moverte"
Plug 'https://github.com/camspiers/lens.vim'
"sirve para buscar y reemplazar en varios archivos a la vez"
Plug 'https://github.com/nvim-pack/nvim-spectre'
"revisa el código y me muestra los errores en el linteo (no sé como se dice en
"español)"
Plug 'dense-analysis/ale'
"smooth scroll when using c-f c-d c-u c-b"
Plug 'karb94/neoscroll.nvim'

"nvim games"
"lichess chess game in nvim"
Plug 'luk400/vim-lichess'
"tetris game for nvim"
Plug 'alec-gibson/nvim-tetris'
"coc-nvim - autocompletado"
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"omnisharp to get csharp completion with coc"
Plug 'OmniSharp/omnisharp-vim'
call plug#end()

" ajustes de vim
color dracula "esquema de color para el editor
set autochdir "cambia automaticamente el directorio de trabajo al directorio del buffer actual"
set autoread "para que lea automaticamente los archivos
set number "habilita la numeracion
set clipboard+=unnamedplus
set numberwidth=1
set relativenumber "el número de las demás lineas es relativo a la actual"
set encoding=utf-8 "para que el editor pueda abrir archivos con carácteres no normales
set title  " muestra el nombre del archivo en la ventana de la terminal
set cursorline  " resalta la línea actual
set colorcolumn=220  " muestra la columna límite a 120 caracteres 
set tabstop=4 " indentación a 4 espacios
set expandtab  " insertar espacios en lugar de <tab>s
set shiftwidth=4

set hidden  " permitir cambiar de buffers sin tener que guardarlos
set ignorecase  " ignorar mayúsculas al hacer una búsqueda
set smartcase  " no ignorar mayúsculas si la palabra a buscar contiene mayúsculas
set spelllang=en,es  " corregir palabras usando diccionarios en inglés y español
set ruler
set syntax=on " pone color a la sintaxis
set termguicolors  " activa true colors en la terminal
set completeopt=menu,menuone,noselect

"This is for the backup files"
set backup
set undofile
set writebackup
set backupdir=~\AppData\Local\nvim_backups
set termguicolors " this variable must be enabled for colors to be applied properly
filetype plugin on


"important: here will be the python3 executable path to avoid issues with the
"venv

"omnisharp config -- needed to functionality"
let g:OmniSharp_server_use_net6 = 1

"configuracion de easyescape
let g:easyescape_chars = { "j": 2, "J": 2 } "caracteres que sustituyen a escape
let g:easyescape_timeout = 100 "tiempo de espera de los caracteres

"configuracion de ultisnips

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" configuracion de rainbow paretheses
let g:rainbow_active = 1 "activa los parentesis de colores

"indent_guides config - neccesary"
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_start = 1

let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}

"ALE configuration"
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\    'python': ['black'],
\    'javascript':['eslint'],
\    'typescript': ['eslint']
\}


"lichess game config -- required for the game"
let g:lichess_api_token = 'lip_bmFk6bjO28vv0rFaWYYr'


" black pieces
let g:lichess_piece_p =
    \   [
    \    "    ,,    ",
    \    "    ,,,,  ",
    \    "    ,,,,  ",
    \    "    ,,,,  ",
    \    "          "] " black pawn
let g:lichess_piece_r =
    \   [
    \    "  , ,, ,  ",
    \    "  ,,,,,,  ",
    \    "  ,,,,,,  ",
    \    " ,,,,,,,, ",
    \    "          "] " black rook
let g:lichess_piece_k =
    \   [
    \    "    ,,    ",
    \    " ,,,,,,,, ",
    \    "    ,,    ",
    \    "    ,,    ",
    \    "          "] " black king
let g:lichess_piece_q =
    \   [
    \    "  , ,, ,  ",
    \    "   ,,,,   ",
    \    "    ,,    ",
    \    "  ,,,,,,  ",
    \    "          "] " black queen
let g:lichess_piece_b =
    \   [
    \    "   ,,,,   ",
    \    "   ,,,,   ",
    \    "    ,,    ",
    \    "  ,,,,,,  ",
    \    "          "] " black bishop
let g:lichess_piece_n =
    \   [
    \    "   ,,,    ",
    \    " ,,, ,,   ",
    \    "    ,,,   ",
    \    "  ,,,,,,  ",
    \    "          "] " black knight

" white pieces
let g:lichess_piece_P =
    \   [
    \    "    ;;    ",
    \    "   ;;;;   ",
    \    "   ;;;;   ",
    \    "   ;;;;   ",
    \    "          "] " white pawn
let g:lichess_piece_R =
    \   [
    \    "  ; ;; ;  ",
    \    "  ;;;;;;  ",
    \    "  ;;;;;;  ",
    \    " ;;;;;;;; ",
    \    "          "] " white rook
let g:lichess_piece_K =
    \   [
    \    "    ;;    ",
    \    " ;;;;;;;; ",
    \    "    ;;    ",
    \    "    ;;    ",
    \    "          "] " white king
let g:lichess_piece_Q =
    \   [
    \    "  ; ;; ;  ",
    \    "   ;;;;   ",
    \    "    ;;    ",
    \    "  ;;;;;;  ",
    \    "          "] " white queen
let g:lichess_piece_B =
    \   [
    \    "   ;;;;   ",
    \    "   ;;;;   ",
    \    "    ;;    ",
    \    "  ;;;;;;  ",
    \    "          "] " white bishop
let g:lichess_piece_N =
    \   [
    \    "   ;;;    ",
    \    " ;;; ;;   ",
    \    "    ;;;   ",
    \    "  ;;;;;;  ",
    \    "          "] " white knight

"keyboard maps

"jj ahora es escape en modo insertar
imap jj <esc>
imap JJ <esc>
" map tab as four spaces

"al presionar escape dos veces en modo normal, quita el resaltado de las busquedas
nnoremap <esc><esc> :nohlsearch<cr>
"esto hace que espacio no haga nada en modo normal. necesario para que espacio
"sea el 'mapleader'
nnoremap <space> <Nop> 
"<leader> es espacio
let mapleader= ' '
"This lets me use Sneak_f with f in normal mode"
map f <Plug>Sneak_f
map F <Plug>Sneak_F

" esto es para guardar los cambios en los archivos
nmap <Leader>w :w<CR>
" esto es para salir de vim forsozamente
nmap <Leader>q :q!<CR>
" esto es para dividir la pantalla verticalmente
nmap <Leader>v :vsp <CR>
"esto es para ir al siguiente búfer
nmap <C-c> :cd ~<CR>
"esto es para abrir la terminal con el archivo actual como argumento
nmap <Leader>tw :term <CR>
"esto es para guardar y salir de vim
nmap <F2> :wq!<CR>
"esto es para abrir ej archivo init.vim, donde se cambian las configuraciones
"del editor
nmap <leader>ev :e ~\AppData\Local\nvim\init.vim<cr>
nmap <leader>s :so ~\AppData\Local\nvim\init.vim<cr>

"c# maps"
nmap <leader># :call ExecuteCompiledCSharpCode()<cr>
nmap <leader>## :call ExecuteFolderCompiledCSharpCode()<cr>

" esto es para eliminar el búfer actual
nmap <Leader>d :bd<CR>

"mapeos de vimplug
nmap <Leader>pi :PlugInstall<CR>
nmap <Leader>pc :PlugClean<CR>

"nvimtree maps"
nnoremap <C-n> :NvimTreeToggle<CR> 
nnoremap <leader>r :NvimTreeRefresh<CR> 
nnoremap <leader>n :NvimTreeFindFile<CR>

"mapeos de fugitive
nmap <Leader>gp :call Pushear()<CR>
nmap <Leader>gc :call Commit()<CR> 
nmap <Leader>ga :call Add()<CR>
nmap <Leader>gl :Git log<CR>
nmap <Leader>gs :Git status<CR>
nmap <Leader>gr :call Remote()<CR>
nmap <Leader>gi :call Initialize()<CR>

"telescope maps"
nmap <leader>tf :Telescope find_files<cr>
nmap <leader>tb :Telescope buffers<cr>
nmap <leader>tg :Telescope live_grep<cr>
nmap <leader>tc :Telescope git_commits<cr>
nmap <leader>tp :Telescope projects<cr>
nmap <leader>tm :Telescope marks<cr>

"lichess nvim maps"
nmap <leader>lf :LichessFindGame<cr>
nmap <leader>lm :LichessMakeMoveUCI<cr>

"tetris map"
nmap <c-t> :Tetris<cr>

"this maps are for write double of the characters and left the cursor in
"middle"
inoremap ' ''<esc>i
inoremap " ""<esc>i
imap [ []<left>
imap { {}<left>
imap ( ()<left>

"terminal maps"
:tnoremap jj <C-\><C-n>
:tnoremap JJ <C-\><C-n>


" coc function remap
:inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"

"ALE remaps"
noremap  gd :ALEGoToDefinition<cr>
noremap <leader>x :ALENext<cr>
noremap <leader>y :ALEPrevious<cr>






" git functions made by me
function Remote()
call inputsave()
    let l:link=input('Enlace del repositorio: ')
call inputrestore()
if link==''
    echo 'No debe estar vacio'
endif
    :execute 'Git remote add origin '.link
endfunction


"this function allows me initialize a repository 
function Initialize()
call inputsave()
    let init = input('¿Desea inicializar un proyecto en git? Y/y/N/n/Enter: ')
call inputrestore()  
if init=="Y" || init=="y" || init==''
    :execute 'Git init'
    echo "Inicializado"
    :call Remote()
else
    echo "Operación cancelada"
endif
endfunction

"this function allows me with leader+c commit to git the added previously
function Commit()
call inputsave()
    let cometer = input('¿Desea guardar los cambios en git?  Y/y/N/n\n')
call inputrestore()  

if cometer=="Y" || cometer=="y" || cometer =='' 
    call inputsave()
        let mensaje= input('Mensaje:\n')
    call inputrestore()
    :execute 'Git commit -m '.'"'. mensaje.'"'
else
    echo "Operación cancelada"
endif
endfunction

"this function allow me  send to git the commited changes
function Pushear()
call inputsave()
    let l:push = input('desea guardar el proyecto en git? Y/y/N/n/Enter: ')
call inputrestore()  
if push=="Y" || push=="y" || push==''
    call inputsave()
        let l:branch = input('En que rama desea guardarlo? Enter para guardarlo en "master"')
    call inputrestore()  

    if l:branch==''
        :execute 'Git push origin master'
    else
        :execute 'Git push origin '. branch 
    endif
else
    echo "Operación cancelada"
endif
endfunction


"This funcion allow me write filenames and add to staging area
function Add() 
call inputsave()
let add=input('File name / Folder name / "%" for current file/ "." for all files in folder:\n')
call inputrestore()
:execute 'Git add '. add
endfunction

"this function will compile and execute the compiled c# code"
function ExecuteCompiledCSharpCode()
    let filename = expand("%:r")
    let extension = expand("%:e")
    if extension == "cs"
        execute "!mcs %"
        let exe_filename = filename.".exe"
        execute "term .\\".exe_filename
    else
        echomsg extension
        echoerr "The file is not a C# file"
    endif
endfunction

function ExecuteFolderCompiledCSharpCode()
    let filename = expand("%:r")
    let extension = expand("%:e")
    if extension == "cs"
        execute "!mcs *.cs"
        let exe_filename = filename.".exe"
        execute "term .\\".exe_filename
    else
        echomsg extension
        echoerr "The file is not a C# file"
    endif
endfunction

"commands that executes automaticly when an event occurs"

"activar el coloreado de parentesis, porque no se activa automaticamente
:autocmd vimenter * silent! :RainbowParentheses :cd %:p:h  
"when i enter on .py or .js files, the <leader>run executes the current file
"with respective program"
:autocmd bufenter *.py :nmap <leader>run :term python %<cr>
:autocmd bufenter *.js :nmap <leader>run :term node %<cr>


"""""""""" FROM HERE, WILL BE ONLY LUA CONFIG FOR PLUGINS
"""""""""" FROM HERE, WILL BE ONLY LUA CONFIG FOR PLUGINS
"""""""""" FROM HERE, WILL BE ONLY LUA CONFIG FOR PLUGINS


" nvim-tree requiere esto
lua << EOF
  require 'nvim-tree'.setup()
EOF

"statusline lua"
lua <<EOF
local colors = {
  red = '#ca1243',
  grey = '#a0a1a7',
  black = '#383a42',
  white = '#f3f3f3',
  light_green = '#83a598',
  orange = '#fe8019',
  green = '#8ec07c',
  blue = '#00f'
}

local theme = {
  normal = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white, bg = colors.black },
    z = { fg = colors.white, bg = colors.black },
  },
  insert = { a = { fg = colors.black, bg = colors.light_green } },
  visual = { a = { fg = colors.black, bg = colors.orange } },
  replace = { a = { fg = colors.black, bg = colors.green } },
}

local empty = require('lualine.component'):extend()
function empty:draw(default_highlight)
  self.status = ''
  self.applied_separator = ''
  self:apply_highlights(default_highlight)
  self:apply_section_separators()
  return self.status
end

-- Put proper separators and gaps between components in sections
local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < 'x'
    for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
      table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.white } })
    end
    for id, comp in ipairs(section) do
      if type(comp) ~= 'table' then
        comp = { comp }
        section[id] = comp
      end
      comp.separator = left and { right = '' } or { left = '' }
    end
  end
  return sections
end

local function search_result()
  if vim.v.hlsearch == 0 then
    return ''
  end
  local last_search = vim.fn.getreg('/')
  if not last_search or last_search == '' then
    return ''
  end
  local searchcount = vim.fn.searchcount { maxcount = 9999 }
  return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
end

local function modified()
  if vim.bo.modified then
    return '+'
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return '-'
  end
  return ''
end

require('lualine').setup {
  options = {
    theme = theme,
    component_separators = '',
    section_separators = { left = '', right = '' },
  },
  sections = process_sections {
    lualine_a = { 'mode' },
    lualine_b = {
      'branch',
      'diff',
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'error' },
        diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
      },
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'warn' },
        diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
      },
      { 'filename', file_status = false, path = 1 },
      { modified, color = { bg = colors.red } },
      {
        '%w',
        cond = function()
          return vim.wo.previewwindow
        end,
      },
      {
        '%r',
        cond = function()
          return vim.bo.readonly
        end,
      },
      {
        '%q',
        cond = function()
          return vim.bo.buftype == 'quickfix'
        end,
      },
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { search_result, 'filetype' },
    lualine_z = { '%l:%c', '%p%%/%L' },
  },
  inactive_sections = {
    lualine_c = { '%f %y %m' },
    lualine_x = {},
  },
}
EOF



"configuracion para cokeline. requerido"
lua <<EOF
EOF


" cokeline configuracion
lua <<EOF



local get_hex = require('cokeline/utils').get_hex
local mappings = require('cokeline/mappings')

local comments_fg = get_hex('Comment', 'fg')
local errors_fg = get_hex('DiagnosticError', 'fg')
local warnings_fg = get_hex('DiagnosticWarn', 'fg')

local red = vim.g.terminal_color_1
local yellow = vim.g.terminal_color_3

local components = {
  space = {
    text = ' ',
    truncation = { priority = 1 }
  },

  two_spaces = {
    text = '  ',
    truncation = { priority = 1 },
  },

  separator = {
    text = function(buffer)
      return buffer.index ~= 1 and '\\' or ''
    end,
    truncation = { priority = 1 }
  },

  devicon = {
    text = function(buffer)
      return
        (mappings.is_picking_focus() or mappings.is_picking_close())
          and buffer.pick_letter .. ' '
           or buffer.devicon.icon
    end,
    fg = function(buffer)
      return
        (mappings.is_picking_focus() and yellow)
        or (mappings.is_picking_close() and red)
        or buffer.devicon.color
    end,
    style = function(_)
      return
        (mappings.is_picking_focus() or mappings.is_picking_close())
        and 'italic,bold'
         or nil
    end,
    truncation = { priority = 1 }
  },

  index = {
    text = function(buffer)
      return buffer.index .. ': '
    end,
    truncation = { priority = 1 }
  },

  unique_prefix = {
    text = function(buffer)
      return buffer.unique_prefix
    end,
    fg = comments_fg,
    style = 'italic',
    truncation = {
      priority = 3,
      direction = 'left',
    },
  },

  filename = {
    text = function(buffer)
      return buffer.filename
    end,
    style = function(buffer)
      return
        ((buffer.is_focused and buffer.diagnostics.errors ~= 0)
          and 'bold,underline')
        or (buffer.is_focused and 'bold')
        or (buffer.diagnostics.errors ~= 0 and 'underline')
        or nil
    end,
    truncation = {
      priority = 2,
      direction = 'left',
    },
  },

  diagnostics = {
    text = function(buffer)
      return
        (buffer.diagnostics.errors ~= 0 and '  ' .. buffer.diagnostics.errors)
        or (buffer.diagnostics.warnings ~= 0 and '  ' .. buffer.diagnostics.warnings)
        or ''
    end,
    fg = function(buffer)
      return
        (buffer.diagnostics.errors ~= 0 and errors_fg)
        or (buffer.diagnostics.warnings ~= 0 and warnings_fg)
        or nil
    end,
    truncation = { priority = 1 },
  },

  close_or_unsaved = {
    text = function(buffer)
      return buffer.is_modified and '●' or ''
    end,
    fg = function(buffer)
      return buffer.is_modified and green or nil
    end,
    delete_buffer_on_left_click = true,
    truncation = { priority = 1 },
  },
}

require('cokeline').setup({
  show_if_buffers_are_at_least = 1,

  buffers = {
    -- filter_valid = function(buffer) return buffer.type ~= 'terminal' end,
    -- filter_visible = function(buffer) return buffer.type ~= 'terminal' end,
    new_buffers_position = 'next',
  },

  rendering = {
    max_buffer_width = 30,
  },

  default_hl = {
    fg = function(buffer)
      return
        buffer.is_focused
        and get_hex('Normal', 'fg')
         or get_hex('Comment', 'fg')
    end,
    bg = get_hex('ColorColumn', 'bg'),
  },

  components = {
    components.space,
    components.separator,
    components.space,
    components.devicon,
    components.space,
    components.index,
    components.unique_prefix,
    components.filename,
    components.diagnostics,
    components.two_spaces,
    components.close_or_unsaved,
    components.space,
  },
})


local map = vim.api.nvim_set_keymap

-- Focus the previous/next buffer
map('n', '<Leader><space>',   '<Plug>(cokeline-focus-prev)',  { silent = true })
map('n', '<Tab>',     '<Plug>(cokeline-focus-next)',  { silent = true })

-- Switch the position of the current buffer with the previous/next buffer.
map('n', '<c-s>p', '<Plug>(cokeline-switch-prev)', { silent = true })
map('n', '<c-s>n', '<Plug>(cokeline-switch-next)', { silent = true })


-- Focus a buffer by its `pick_letter`.
map('n', '<c-p>c', '<Plug>(cokeline-pick-close)', { silent = true })

-- Close a buffer by its `pick_letter`.
map('n', '<c-p>f', '<Plug>(cokeline-pick-focus)', { silent = true })

for i = 1,9 do
  map('n', ('<Leader>f%s'):format(i),      ('<Plug>(cokeline-focus-%s)'):format(i),  { silent = true })
  map('n', ('<Leader>s%s'):format(i), ('<Plug>(cokeline-switch-%s)'):format(i), { silent = true })
end
EOF


" ajustes de indent_blankline"
lua << EOF
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    show_end_of_line = true,
    space_char_blankline = " ",
}

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}

EOF

"Configuración para CMP
lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
     {
      { name = 'buffer' },
    }
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })



EOF


"here will be the project.nvim setup"
"project.nvim integration with telescope"
lua <<EOF
    require("project_nvim").setup {}
    -- extensions for telescope - projects and media_files
    require('telescope').load_extension('projects')

EOF

"here will be the neoscroll setup and config"
lua <<EOF
require('neoscroll').setup()
EOF

