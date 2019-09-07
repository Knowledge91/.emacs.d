;;; init.el --- Initialization file for Emacs
;;; Commentary: Emacs Startup File --- initialization for Emacs


;;; Code: somehting
(use-package tex
  :mode "\\.tex\\'"
  :defer t
  :ensure auctex
  :ensure auctex-latexmk
  :config
  (setq TeX-parse-self t)
  (setq TeX-auto-save t)
  (setq TeX-PDF-mode t)
  (setq TeX-engine 'luatex)
  (auctex-latexmk-setup)
  (add-hook 'TeX-mode-hook 'flyspell-mode)
  :general (
    :states '(normal)
    :prefix ","
    "b" '((lambda () (interactive) (TeX-command "LatexMk" 'TeX-master-file -1)) :which-key "build")
    ))

