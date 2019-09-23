
echo "You are about to setup VIM\n"
read -p "Are you sure? [y/n]" choice
case "$choice" in
  y|Y ) main();;
  n|N ) echo "Operation cancelled"; exit 1;;
  * ) echo "invalid"; exit 1;
esac

function install_vim {
  echo "Installing text editors..."
  apt-get install vim
  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
  git clone https://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
  git clone https://github.com/bling/vim-airline             ~/.vim/bundle/vim-airline
  git clone https://github.com/kien/ctrlp.vim.git            ~/.vim/bundle/ctrlp.vim
  git clone https://github.com/scrooloose/nerdtree.git       ~/.vim/bundle/nerdtree
  git clone https://github.com/scrooloose/nerdcommenter.git  ~/.vim/bundle/nerdcommenter
  git clone https://github.com/airblade/vim-gitgutter.git    ~/.vim/bundle/vim-gitgutter
  git clone https://github.com/tpope/vim-surround.git        ~/.vim/bundle/vim-surround
  git clone https://github.com/tpope/vim-repeat.git          ~/.vim/bundle/vim-repeat
  git clone https://github.com/elixir-lang/vim-elixir.git    ~/.vim/bundle/vim-elixir
  git clone --depth=1 https://github.com/rust-lang/rust.vim.git ~/.vim/bundle/rust.vim
  git clone https://github.com/tomlion/vim-solidity.git ~/.vim/bundle/vim-solidity
  git clone https://github.com/pangloss/vim-javascript.git ~/.vim/bundle/vim-javascript
  git clone https://github.com/mxw/vim-jsx.git ~/.vim/bundle/vim-jsx
  git submodule add https://github.com/octol/vim-cpp-enhanced-highlight.git ~/.vim/bundle/syntax
  git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/bundle/typescript-vim
  git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline

}

function setup_dotfiles {
  echo "Setting up dotfiles..."
  cd ~
  git clone https://github.com/pythonpete32/auto-dev-enviroment.git
  rm ~/.vimrc
  ln -s ~/auto-dev-enviroment/.vimrc ~/.vimrc 
}

function main() {
  apt-get update
  install_vim()
  setup_dotfiles()
}