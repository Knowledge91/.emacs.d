(use-package elpy ; python development environment
  :ensure t
  :config
  (elpy-enable)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
