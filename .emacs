(setq-default debug-on-error t)
(setq-default inhibit-startup-message t)
(setq package-archives
      '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)
(setq-default frame-title-format "%f")
(setq-default make-backup-files nil)
(global-auto-revert-mode t)
(global-hl-line-mode t)
(show-paren-mode t)
(display-time-mode t)
(setq-default column-number-mode t)
(size-indication-mode t)
(setq-default x-select-enable-clipboard t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(set-scroll-bar-mode nil)
(global-linum-mode)
(fset 'yes-or-no-p 'y-or-n-p)

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
