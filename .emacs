(setq-default debug-on-error t)
(setq-default inhibit-startup-message t)
(setq package-archives '(("gnu" . "https://mirrors.ustc.edu.cn/elpa/gnu/")
                         ("melpa" . "https://mirrors.ustc.edu.cn/elpa/melpa/")
                         ("melpa-stable" . 
                          "https://mirrors.ustc.edu.cn/elpa/melpa-stable/")
                         ("org" . "https://mirrors.ustc.edu.cn/elpa/org/")))
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
(setq-default x-select-enable-clipboard t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(setq-default scroll-bar-mode-explicit t)
(set-scroll-bar-mode nil)
(global-linum-mode)
(fset 'yes-or-no-p 'y-or-n-p)
(set-fill-column 80)

(defun add-before-save-hook (hook)
  (add-hook 'before-save-hook hook))

(require 'uniquify)
(setq-default uniquify-buffer-name-style 'post-forward)

;; Global key bindings
(global-set-key (kbd "C-a") 'kill-region)
(global-set-key (kbd "C-w") 'move-beginning-of-line)
(global-set-key (kbd "C-e") 'move-end-of-line)
(global-set-key (kbd "C-f") 'forward-word)
(global-set-key (kbd "C-b") 'backward-word)
(global-set-key (kbd "M-f") 'forward-char)
(global-set-key (kbd "M-b") 'backward-char)

;; Prefer spaces
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; Before save hooks
(add-before-save-hook 'delete-trailing-whitespace)

;; Template code
(fset 'write-python-header "\
#!/usr/bin/env python
# -*- coding: utf-8 -*-
")

(fset 'write-cc-copyright
      (format
       "\/\/ Copyright (c) %s Kai Luo <gluokai@gmail.com>. All rights reserved."
       (format-time-string "%Y")))

;; Looks
(require 'monokai-theme)
(setq-default default-frame-alist
             '((cursor-color . "white")
               (font . "Monospace-12")))

;; auto-complete
(require 'auto-complete-config)
(ac-config-default)

;; clang-format
(defun run-clang-format ()
  (if (or (eq major-mode 'c-mode)
          (eq major-mode 'cc-mode)
          (eq major-mode 'c++-mode)) (clang-format-buffer)))
(add-before-save-hook 'run-clang-format)

;; yapf
(py-yapf-enable-on-save)

;; rust-mode
(require 'rust-mode)
(setq-default rust-format-on-save t)

;; go-mode
(require 'go-mode)
(add-before-save-hook 'gofmt-before-save)

;; llvm
(require 'llvm-mode)
(require 'tablegen-mode)

;; yaml
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.mir\\'" . yaml-mode))
