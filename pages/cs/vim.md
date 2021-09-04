Vim Configuration

    /etc/vimrc

    "https://realpython.com/vim-and-python-a-match-made-in-heaven/

    " This line should not be removed as it ensures that various options are
    " properly set to work with the Vim-related packages available in Debian.
    runtime! debian.vim

    set nocompatible              " required
    filetype off                  " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'

    " add all your plugins here (note older versions of Vundle
    " used Bundle instead of Plugin)

    " ...

    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required

    " All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
    " the call to :runtime you can find below.  If you wish to change any of those
    " settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
    " will be overwritten everytime an upgrade of the vim packages is performed.
    " It is recommended to make changes after sourcing debian.vim since it alters
    " the value of the 'compatible' option.

    " Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
    " This happens after /etc/vim/vimrc(.local) are loaded, so it will override
    " any settings in these files.
    " If you don't want that to happen, uncomment the below line to prevent
    " defaults.vim from being loaded.
    " let g:skip_defaults_vim = 1

    " Uncomment the next line to make Vim more Vi-compatible
    " NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
    " options, so any other options should be set AFTER setting 'compatible'.
    "set compatible

    " Vim5 and later versions support syntax highlighting. Uncommenting the next
    " line enables syntax highlighting by default.
    if has("syntax")
      syntax on
    endif

    " If using a dark background within the editing area and syntax highlighting
    " turn on this option as well
    "set background=dark

    " Uncomment the following to have Vim jump to the last position when
    " reopening a file
    "if has("autocmd")
    "  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    "endif

    " Uncomment the following to have Vim load indentation rules and plugins
    " according to the detected filetype.
    "if has("autocmd")
    "  filetype plugin indent on
    "endif

    " The following are commented out as they cause vim to behave a lot
    " differently from regular Vi. They are highly recommended though.
    "set showcmd		" Show (partial) command in status line.
    "set showmatch		" Show matching brackets.
    "set ignorecase		" Do case insensitive matching
    "set smartcase		" Do smart case matching
    "set incsearch		" Incremental search
    "set autowrite		" Automatically save before commands like :next and :make
    "set hidden		" Hide buffers when they are abandoned
    "set mouse=a		" Enable mouse usage (all modes)

    " Source a global configuration file if available
    if filereadable("/etc/vim/vimrc.local")
      source /etc/vim/vimrc.local
    endif

    " Enable folding
    set foldmethod=indent
    set foldlevel=99

    " Enable folding with the spacebar
    nnoremap <space> za

    Plugin 'tmhedberg/SimpylFold'

    let g:SimpylFold_docstring_preview=1

    au BufNewFile,BufRead *.py
        \ set tabstop=4
        \ set softtabstop=4
        \ set shiftwidth=4
        \ set textwidth=79
        \ set expandtab
        \ set autoindent
        \ set fileformat=unix

    au BufNewFile,BufRead *.js, *.html, *.css
        \ set tabstop=2
        \ set softtabstop=2
        \ set shiftwidth=2

    Plugin 'vim-scripts/indentpython.vim'

    au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

    set encoding=utf-8

    Bundle 'Valloric/YouCompleteMe'

    let g:ycm_autoclose_preview_window_after_completion=1
    map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

    "python with virtualenv support
    py << EOF
    import os
    import sys
    if 'VIRTUAL_ENV' in os.environ:
      project_base_dir = os.environ['VIRTUAL_ENV']
      activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
      execfile(activate_this, dict(__file__=activate_this))
    EOF

    "python with virtualenv support
    py << EOF
    import os
    import sys
    if 'VIRTUAL_ENV' in os.environ:
      project_base_dir = os.environ['VIRTUAL_ENV']
      activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
      execfile(activate_this, dict(__file__=activate_this))
    EOF

    "python with virtualenv support
    py << EOF
    import os
    import sys
    if 'VIRTUAL_ENV' in os.environ:
      project_base_dir = os.environ['VIRTUAL_ENV']
      activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
      execfile(activate_this, dict(__file__=activate_this))
    EOF

    Plugin 'vim-syntastic/syntastic'

    Plugin 'nvie/vim-flake8'

    let python_highlight_all=1
    syntax on

    Plugin 'jnurmine/Zenburn'
    Plugin 'altercation/vim-colors-solarized'

    if has('gui_running')
      set background=dark
      colorscheme solarized
    else
      colorscheme zenburn
    endif

    call togglebg#map("<F5>")

    Plugin 'scrooloose/nerdtree'

    Plugin 'jistr/vim-nerdtree-tabs'

    let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

    Plugin 'kien/ctrlp.vim'

    set nu

    Plugin 'tpope/vim-fugitive'

    Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

    set clipboard=unnamed

    set editing-mode vi

    " Use ctrl-[hjkl] to select the active split!
    nmap <silent> <c-k> :wincmd k<CR>
    nmap <silent> <c-j> :wincmd j<CR>
    nmap <silent> <c-h> :wincmd h<CR>
    nmap <silent> <c-l> :wincmd l<CR>

    nnoremap <buffer> <F9> :exec '!python3' shellescape(@%, 1)<cr>
    "imap <F5> <Esc>:w<CR>:!clear;python %<CR>

    nnoremap ü <C-]>
    nnoremap Ü <C-O>
