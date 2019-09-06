;;; init.el --- Initialization file for Emacs
;;; Commentary: Emacs Startup File --- initialization for Emacs


;;; Code: somehting

(use-package tex
  :defer t
  :ensure auctex
  :config
  (setq TeX-parse-self t)
  (setq TeX-auto-save t)
  (setq TeX-PDF-mode t)
  (add-hook 'TeX-mode-hook 'flyspell-mode))

