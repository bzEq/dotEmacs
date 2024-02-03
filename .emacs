;;(prefer-coding-system 'utf-8)
(setq-default debug-on-error t)
(setq-default inhibit-startup-message t)
;;(setq package-native-compile t)
;;(setq package-archives
;;      '(
;;        ("gnu" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/gnu/")
;;        ("nongnu" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/nongnu/")
;;        ("melpa" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/melpa/")
;;        ("stable-melpa" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/stable-melpa/")
;;        ("org" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/org/")
;;        ))
(setq package-archives
      '(("gnu"    . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("nongnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
        ("melpa"  . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
        ("stable-melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/stable-melpa/")
        ("org" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
        ))
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp")
(setq-default frame-title-format "%f")
(setq-default make-backup-files nil)
(global-auto-revert-mode t)
(global-hl-line-mode 0)
(show-paren-mode t)
(display-time-mode t)
(setq-default column-number-mode t)
(size-indication-mode t)
;;(setq-default x-select-enable-clipboard t)
(menu-bar-mode 0)
(tool-bar-mode 0)
;;(setq-default scroll-bar-mode-explicit t)
(set-scroll-bar-mode nil)
;;(global-linum-mode)
(fset 'yes-or-no-p 'y-or-n-p)
;;(set-fill-column 80)
(setq-default cursor-type 'box)

(defun add-before-save-hook (hook)
  (add-hook 'before-save-hook hook))

(require 'uniquify)
(setq-default uniquify-buffer-name-style 'post-forward)

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
(setq-default indent-tabs-mode nil)
(setq-default sh-basic-offset 2)

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

;;(setq-default default-frame-alist
;;              '((cursor-color . "white")
;;                (font . "Roboto Mono-12")))

;;(require 'auto-complete-config)
;;(ac-config-default)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(defun run-clang-format ()
  (if (or (eq major-mode 'c-mode)
          (eq major-mode 'cc-mode)
          (eq major-mode 'c++-mode)
          )
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
