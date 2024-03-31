if [[ -d ~/.bashrc.d ]]; then
  for rc in ~/.bashrc.d/*; do
    [[ -f "$rc" ]] && . "$rc"
  done
fi
unset rc

prepend_to_PATH_if_exists "/opt/clang/bin"
prepend_to_PATH_if_exists "/usr/local/cuda/bin"
export GOPATH="${HOME}/go"
append_to_PATH_if_exists "${GOPATH}/bin"

export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
[[ -f "${HOME}/.cargo/env" ]] && . "${HOME}/.cargo/env"
