# NVIM

## Prequisites

- `Neovim`
- `Tmux`
- `Tmux Plugin Manager`

  ```shell
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ```
  
## Install

- Clone

  ```shell
  git clone git@github.com:zsmatrix62/nvim.git ~/.config/nvim && \
  nvim
  ```

- Copy tmux configuration & reload

  ```shell
  rm -rf ~/.tmux.conf && \
  cp ~/.config/nvim/.tmux.conf ~/.tmux.conf && \
  tmux source-file ~/.tmux.conf
  ```

  Install & update tmux plugins: `tmux` & `<ctrl-b>I`

## Appendix

- `tmux` plugin manager shortcuts:
  - `prefix + I` install and update plugins & source tmux config
  - `prefix + U` update plugins
  - `prefix + alt + u` remove plugin
