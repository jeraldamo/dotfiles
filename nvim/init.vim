source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/themes/airline.vim

colorscheme nord

lua << EOF
  require'lspconfig'.rust_analyzer.setup{}
EOF
