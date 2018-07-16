# About

Repository with all my dotfiles. Works on both **macOS** & **Linux**.

# Vim files

My Vim configuration files can be found in this repository: [lucascaton/vimfiles](https://github.com/lucascaton/vimfiles).

# How to install?

Firstly, install [oh my zsh](https://github.com/robbyrussell/oh-my-zsh).

Then, run:

    git clone git://github.com/lucascaton/dotfiles.git ~/.dotfiles
    ~/.dotfiles/install.sh

Finally, install the following plugins:

    git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions       ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/bhilburn/powerlevel9k.git           ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel9k

# Copyright

Copyright (c) 2018 Lucas Caton

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
