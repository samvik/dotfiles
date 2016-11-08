" Basic vim configuration
set nocompatible
syntax on
filetype plugin on

" Initialize file searching to recursive from where vim was started
set path+=**
set wildmenu 

" Load other configuration files
for f in split(glob('~/.vimrc.d/*.vim'), '\n')
    exe 'source' f
endfor
