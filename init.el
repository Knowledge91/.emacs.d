(setq package-enable-at-startup nil) ; tells emacs not to load any packages before starting up
;; the following lines tell emacs where on the internet to look up
;; for new packages.
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize) ; guess what this one does ?

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package) ; unless it is already installed
  (package-refresh-contents) ; updage packages archive
  (package-install 'use-package)) ; and install the most recent version of use-package
(require 'use-package)

(use-package evil
  :ensure t
  :config (evil-mode +1))

(use-package paredit
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook #'paredit-mode))




(setq inhibit-startup-screen t)
(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0)) ; show keybinding functions
(use-package general ; keybindings
  :ensure t
  :config
  (general-define-key
    :states '(normal visual insert emacs)
    :prefix "SPC"
    :non-normal-prefix "C-SPC"

  "TAB" '(mode-line-other-buffer :which-key "prev buffer")

  ;; files
  "f" '(:which-key "files")
  "ff" '(helm-find-files :which-key "find files")
  "fs" '(save-buffer :which-key "save file")

  ;; project
  "p" '(:which-key "project")
  "pf" '(helm-projectile-find-file :which-key "find file")
  "pp" '(helm-projectile-switch-project :which-key "switch project")

  ;; git
  "g" '(magit-status :which-key "magit")))




(use-package material-theme
  :ensure t)

(use-package elpy
  :ensure t
  :config
  (elpy-enable))

(use-package flycheck
  :ensure t
  :config
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(use-package helm
  :ensure t
  :config
  (helm-mode 1))


;; Set Super Key to Command
(setq ns-command-modifier 'super)

;; Project Organisation
(use-package projectile
  :ensure t
  :config
  (setq projectile-indexing-method 'alien) ; use external cmds find and git to index files
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

(use-package helm-projectile ; Open Projectile in Helm
  :ensure t
  :config
  (setq projectile-completion-system 'helm)
  (helm-projectile-on))

(use-package shackle ; Helm window always bottom
  :ensure t
  :config
  (shackle-mode +1)
  (setq shackle-rules '(("\\`\\*helm.*?\\*\\'" :regexp t :align t :ratio 0.4))))

(load (expand-file-name "./git/init.el" user-emacs-directory))
(load (expand-file-name "./react/init.el" user-emacs-directory))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (evil-magit general which-key shackle helm-projectile exec-path-from-shell tide web-mode rjsx-mode use-package flycheck helm material-theme elpy evil-leader evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
