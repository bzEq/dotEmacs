;;(prefer-coding-system 'utf-8)
(fset 'yes-or-no-p 'y-or-n-p)
(setq-default debug-on-error t)
(setq-default inhibit-startup-message t)
;;(setq package-native-compile t)
;;(setq package-archives
;;      '(
;;        ("gnu"          . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/gnu/")
;;        ("nongnu"       . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/nongnu/")
;;        ("melpa"        . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/melpa/")
;;        ("stable-melpa" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/stable-melpa/")))
;;(setq package-archives
;;      '(("gnu"          . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;        ("nongnu"       . "https://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
;;        ("melpa"        . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
;;        ("stable-melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/stable-melpa/")))
(setq package-archives
      '(("gnu"          . "https://mirrors.ustc.edu.cn/elpa/gnu/")
        ("melpa"        . "https://mirrors.ustc.edu.cn/elpa/melpa/")
        ("stable-melpa" . "https://mirrors.ustc.edu.cn/elpa/stable-melpa/")
        ("nongnu"       . "https://mirrors.ustc.edu.cn/elpa/nongnu/")))
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp")
(setq-default custom-file "~/.emacs.d/custom.el")
(setq-default frame-title-format "%f")
(setq-default make-backup-files nil)
;;(setq-default x-select-enable-clipboard t)
;;(setq-default scroll-bar-mode-explicit t)
;;(setq-default cursor-type 'box)
(global-auto-revert-mode)
(show-paren-mode)
(column-number-mode)
(size-indication-mode)
(display-time-mode)
;;(global-hl-line-mode)
;;(menu-bar-mode)
;;(tool-bar-mode)
;;(set-scroll-bar-mode)
;;(global-linum-mode)
;;(set-fill-column 80)

(require 'uniquify)
(setq-default uniquify-buffer-name-style 'post-forward)

(defun add-before-save-hook (hook)
  (add-hook 'before-save-hook hook))

;; Global key bindings.
(global-set-key (kbd "C-a") 'kill-region)
(global-set-key (kbd "C-w") 'move-beginning-of-line)
(global-set-key (kbd "C-e") 'move-end-of-line)
(global-set-key (kbd "C-f") 'forward-word)
(global-set-key (kbd "C-b") 'backward-word)
(global-set-key (kbd "M-f") 'forward-char)
(global-set-key (kbd "M-b") 'backward-char)

;; Prefer spaces.
(setq-default tab-width 2)
(indent-tabs-mode 0)

;; Template code
(fset 'write-python-header "\
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
")

(fset 'write-cc-copyright
      (format
       "\/\/ Copyright (c) %s Kai Luo <gluokai@gmail.com>. All rights reserved."
       (format-time-string "%Y")))

(fset 'write-sh-copyright
      (format
       "# Copyright (c) %s Kai Luo <gluokai@gmail.com>. All rights reserved."
       (format-time-string "%Y")))


(fset 'write-python-main "\
import os
import sys
import re
import subprocess
import shlex
import shutil
import tempfile
import logging


def main():
    return 0


if __name__ == '__main__':
    sys.exit(main())
")


;;(load-theme 'spacemacs-dark t)

;;(setq-default
;; default-frame-alist
;; '((font . "Roboto Mono-12")))

;;(require 'auto-complete-config)
;;(ac-config-default)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;;(require 'clang-format)
;;(setq-default clang-format-fallback-style "LLVM")
(defun bind-clang-format-region-keys ()
  (local-set-key (kbd "C-c C-f") 'clang-format-region))
(add-hook 'c++-mode-hook 'bind-clang-format-region-keys)
(add-hook 'c-mode-hook 'bind-clang-format-region-keys)

(defun run-clang-format ()
  (if (or (eq major-mode 'c-mode)
          (eq major-mode 'cc-mode)
          (eq major-mode 'c++-mode))
      (clang-format-buffer)))
;;(add-before-save-hook 'run-clang-format)

(defun run-clang-format-java ()
  (if (eq major-mode 'java-mode)
      (clang-format-buffer)))
;;(add-before-save-hook 'run-clang-format-java)

;;(add-before-save-hook 'delete-trailing-whitespace)

;; rust-mode
;;(require 'rust-mode)
;;(setq-default rust-format-on-save t)

;; go-mode
;;(require 'go-mode)
;;(add-before-save-hook 'gofmt-before-save)

;; llvm
;;(require 'llvm-mode)
;;(require 'tablegen-mode)

;; yaml
;;(require 'yaml-mode)
;;(add-to-list 'auto-mode-alist '("\\.mir\\'" . yaml-mode))

;; python
;;(require 'py-yapf)
;;(add-hook 'python-mode-hook 'py-yapf-enable-on-save)

(load-file custom-file)
