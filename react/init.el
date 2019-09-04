(message "Loading React packages")

;; Set exec path from shell
(use-package exec-path-from-shell :ensure t
  :demand
  :config
  (exec-path-from-shell-initialize))

(use-package rjsx-mode
  :ensure t)


(use-package company
  :ensure t
  :config
  (setq company-minimum-prefix-length 1)
  :hook
  (after-init . global-company-mode))


(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(use-package typescript-mode
  :ensure t
  :init
  (setq typescript-indent-level 2))

(use-package tide
  :ensure t
  :config
  (add-hook 'before-save-hook #'tide-format-before-save)
  (add-hook 'typescript-mode-hook #'setup-tide-mode))





(setq company-tooltip-align-annotations t)


  

 

