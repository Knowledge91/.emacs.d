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

(use-package use-package-ensure-system-package :ensure t)

(use-package org
  :ensure t
  :config
  (org-babel-load-file (expand-file-name "myInit.org" user-emacs-directory)))

(use-package evil
  :ensure t
  :config
  (evil-mode +1))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-collection-setup-minibuffer t)
 '(package-selected-packages
   '(clang-format yasnippet-snippets cmake-mode ccls magit platformio-mode helm-lsp company-lsp yasnippet flutter-l10n-flycheck flutter dart-mode lsp-mode use-package-ensure-system-package markdown-mode gist json-mode auctex-lua org-bullets typescript evil-collection neotree auctex-latexmk ranger evil-ranger zenburn-theme solarized-theme solarized-dark prettier-js prettier winum emacs-winum window-numbering evil-magit general which-key shackle helm-projectile exec-path-from-shell tide web-mode rjsx-mode use-package flycheck helm material-theme elpy evil-leader evil))
 '(safe-local-variable-values
   '((projectile-project-test-cmd . "./build/test")
     (projectile-project-run-cmd . "./build/main")
     (projectile-project-run-cmd . ".build/main")
     (projectile-project-compilation-cmd . "cd ./build && cmake .. && make")
     (projectile-project-run-cmd . "./main")
     (projectile-project-compilation-cmd . "make main")
     (projectile-project-test-cmd . "./build/runUnitTests")
     (projectile-project-run-cmd . "./build/FESR")
     (projectile-project-compilation-cmd . "make -C ./build -j8 default_target"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
