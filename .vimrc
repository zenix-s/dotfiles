syntax on
set number
set autoindent
set ruler
set history=1000
set showcmd
set nu rnu
set numberwidth=1
set clipboard=unnamedplus
set showmatch
set laststatus=2
set cursorline
<
"42 Config
"Activate indentation
filetype off
filetype plugin indent on
filetype plugin on
set smartindent

"Non-expanded, 4-wide tabulations
set tabstop=4
set shiftwidth=4
set noexpandtab

"Disable vi-compatibility
set nocompatible

"Real-world encoding
set encoding=utf-8

"Interpret modelines in files
set modelines=1

"Do not abandon buffers
set hidden

"Don't bother throttling tty
set ttyfast

"More useful backspace behavior
set backspace=indent,eol,start

"Use statusbar on all windows
set laststatus=2

"Better search
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

