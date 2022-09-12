"NOTA: Ctags debe ser agregado a PATH y la ruta de python1 o 2 en una variable llamada g:python3_host_prog. Para los plugins se requiere de Git instalado en la pc. Para CoC se requiere NodeJs instalado en la pc. La variable $PATH en el archivo es para la preview de fzf

call plug#begin('~/.vim/plugged')


"lualine"
Plug 'nvim-lualine/lualine.nvim'

"bufferline"
Plug 'noib3/nvim-cokeline'

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

Plug 'https://github.com/tpope/vim-surround'

"snippets para vim
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"para ayudarme a salir de modo insertar mas rapido 
Plug 'zhou13/vim-easyescape'
"integrar git a vim"
Plug 'tpope/vim-fugitive'
"resaltado de sintaxis"
Plug 'sheerun/vim-polyglot'
"tema para vim
"pone colores a las parejas de parentesis para verlos mas facilmente"
Plug 'junegunn/rainbow_parentheses.vim' 
""buscador difuso
"me permite comentar presionando leader+cc"
Plug 'preservim/nerdcommenter'
"permite moverse entre pestañas con ctrl + direccion vimniana"
Plug 'christoomey/vim-tmux-navigator'

Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
""NUEVO AUTOCOMPLETADO"

"estos son plugins cmp, para autocompletado mediante los servidores lsp"
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
call plug#end()

" ajustes de vim
color dracula "esquema de color para el editor

set autochdir "cambia automaticamente el directorio de trabajo al directorio del buffer actual"
set autoread "para que lea automaticamente los archivos
set number "habilita la numeracion
"set mouse=a "permite que se pueda usar el mouse"
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





"configuracion de easyescape
let g:easyescape_chars = { "j": 2 } "caracteres que sustituyen a escape
let g:easyescape_timeout = 500 "tiempo de espera de los caracteres

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
"this function allow me 
function Pushear()
call inputsave()
    let l:push = input('desea guardar el proyecto en git? Y/y/N/n/Enter: ')
call inputrestore()  
if push=="Y" || push=="y" || push==''
    call inputsave()
        let l:branch = input('En que rama desea guardarlo? Enter para guardarlo en "master"')
    call inputrestore()  

    if l:branch==''
        branch = 'master'
    endif
    :execute 'Git push origin '. branch 
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


"mapeos

"jj ahora es escape en modo insertar
imap jj <esc>
"al presionar escape dos veces en modo normal, quita el resaltado de las busquedas
nnoremap <esc><esc> :nohlsearch<cr>
"esto hace que espacio no haga nada en modo normal. necesario para que espacio
"sea el 'mapleader'
nnoremap <space> <Nop> 
"<leader> es espacio
let mapleader= ' '

nmap <leader>x :call Formatear()<cr>
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
nmap <leader>ev :e $myvimrc<cr>
nmap <leader>s :so %<cr>

"bufers
"nmap <Tab> :bn<CR>
" esto es para eliminar el búfer actual
"nmap <Leader><space> :bp<CR>
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


"mapeos de nerdtree

"etiquetas


"mapeos de python 

"abrir terminal de python con bufer actual como argumento



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
"comando para ejecutar el archivo actual con: node, python y powershell
:autocmd bufenter *.py :nmap <leader>run :term python %<cr>
:autocmd bufenter *.js :nmap <leader>run :term node %<cr>
:autocmd bufenter *.ps1 :nmap <leader>run :term powershell %<cr>


imap [ []<left>
imap { {}<left>
imap ( ()<left>
inoremap ' ''<Esc>i
inoremap <c-'> '<Esc>a
inoremap " ""<Esc>i

"la funcion verifica si el bufer en el que estoy actualmente es el init.vim, y si 
"es así mapea leader + S para usar :so % 
function Ruta()
  let path = expand('%:p') 
  if path == 'C:\Users\crist\Appdata\Local\nvim\init.vim'
nmap <leader>s :so %<cr>
else
unmap <leader>s

endif

endfunction


function Formatear()
  execute 'term python c:\users\crist\downloads\creative_projects\python\automate_scripts\formateador.py ' . expand('%')
  echo 'EL ARCHIVO ACTUAL HA SIDO FORMATEADO'
endfunction


:tnoremap jj <C-\><C-n>

set termguicolors

lua << EOF
  require('lualine').setup()
EOF
set backup
set undofile
set writebackup
set backupdir=~/nvim_backups



nnoremap <C-n> :NvimTreeToggle<CR> 
nnoremap <leader>r :NvimTreeRefresh<CR> 
nnoremap <leader>n :NvimTreeFindFile<CR>

set termguicolors " this variable must be enabled for colors to be applied properly


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

"telescope maps"
nmap <leader>tf :Telescope find_files<cr>
nmap <leader>tb :Telescope buffers<cr>
nmap <leader>tg :Telescope grep_string<cr>
nmap <leader>tc :Telescope git_commits<cr>

let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_start = 1

set completeopt=menu,menuone,noselect

"configuracion para cokeline. requerido"
lua <<EOF
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
      return buffer.index ~= 1 and '▏' or ''
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
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'ultisnips' }, -- For ultisnips users.
    }, {
      { name = 'buffer' },
    })
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




  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true
    -- Servidores que están funcionando
    -- LpsConfig no los instala correctamente, deben ser instalados manualmente
    -- con NPM i -g <server-name>
  require('lspconfig')['html'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['vimls'].setup {
    capabilities = capabilities
  }
require('lspconfig')['cssls'].setup {
    capabilities = capabilities
}
require( 'lspconfig' )['clangd'].setup{
    capabilities = capabilities
}
  require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['powershell_es'].setup {
    bundle_path = 'C:/Users/crist/AppData/Local/coc/extensions/node_modules/coc-powershell/PowerShellEditorServices',
    shell = 'pwsh',
    capabilities = capabilities
  }

EOF

"COnfiguración para LSP
lua << EOF
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>ex', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>p', vim.diagnostic.setloclist, opts)


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end
local lsp_flags = {
  -- This is the default in Nvim -1.7+
  debounce_text_changes = 150,
}
  -- Servidores que están funcionando
  -- LpsConfig no los instala correctamente, deben ser instalados manualmente
  -- con NPM i -g <server-name>
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['vimls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['html'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['cssls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require( 'lspconfig' )['clangd'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['powershell_es'].setup{
  bundle_path = 'C:/Users/crist/AppData/Local/coc/extensions/node_modules/coc-powershell/PowerShellEditorServices',
  on_attach = on_attach,
  flags = lsp_flags,
}

local lsp_defaults = {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
  on_attach = function(client, bufnr)
    vim.api.nvim_exec_autocmds('User', {pattern = 'LspAttached'})
  end
}
EOF


