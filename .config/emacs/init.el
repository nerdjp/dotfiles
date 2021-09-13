(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
	     '("org" . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives
	     '("gnu" . "https://elpa.gnu.org/packages/"))
(package-refresh-contents)
(package-initialize)

;Make sure use package is installed
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;Always ensure a package is installed
(require 'use-package-ensure)
  (setq use-package-always-ensure t)

;Font
(set-face-attribute 'default nil
		    :font "JetBrains Mono 10"
		    :weight 'medium)
(set-face-attribute 'variable-pitch nil
		    :font "JetBrains Mono 10"
		    :weight 'medium)
(set-face-attribute 'fixed-pitch nil
		    :font "JetBrains Mono 10"
		    :weight 'medium)

;Needed for emacsclient
(add-to-list 'default-frame-alist '(font . "JetBrains Mono 10"))

;Colorscheme
(load-theme 'doom-one t)
(use-package doom-modeline)

;GUI
;Remove GUI
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;Line numbers
(global-display-line-numbers-mode)

(dolist (mode
	 '(term-mode-hook
	   shell-mode-hook
	   eshell-mode-hook
	   treemacs-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;Show parentesis parent
(show-paren-mode)

;Line highlight
(global-hl-line-mode t)

(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))

;Say y or n instead of yes or no
(defalias 'yes-or-no-p 'y-or-n-p)

;Pretty file tabs
(use-package centaur-tabs
  :config
  (centaur-tabs-mode t)
  (setq centaur-tabs-height 24)
  (setq centaur-tabs-set-icons t)
  (setq centaur-tabs-set-bar 'over)
  (setq centaur-tabs-set-modified-marker t)
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward))

;TAB ARE TABS NOT FUCKING SPACES
(setq backward-delete-char-untabify-method 'nil)
(setq-default tab-width 8)


;Auto-update packages
(use-package auto-package-update
  :defer nil
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;Follow splits
(defun split-and-follow-horizontally ()
	(interactive)
	(split-window-below)
	(balance-windows)
	(other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically ()
	(interactive)
	(split-window-right)
	(balance-windows)
	(other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

;Evil mode cuz I like modal editing and am used to vim bindings
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;Dashboard for a nice main menu
(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-center-content t)
  (dashboard-modify-heading-icons '((recents . "file-text")))
  (setq dashboard-startup-banner "~/.config/emacs/dashboard.png")
  (setq dashboard-set-navigator t)
  (setq dashboard-items '((recents . 5)
			  (bookmarks . 5)
			  (projects . 5)
			  (agenda . 5)
			  (registers . 5)))
  (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*"))))

;Nice looking break lines
(use-package page-break-lines)

;Preview for keychords
(use-package which-key
  :init
  (setq which-key-show-early-on-C-h t)
  :config
  (which-key-mode))

;Icons
(use-package all-the-icons)
(use-package all-the-icons-dired)

;Programing
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  (c++-mode . lsp-deferred)
  (c-mode . lsp-deferred)
  (lsp-mode . lsp-enable-which-key-integration)
  :commands (lsp lsp-deferred))

(use-package company
  :hook
  (lsp-mode . company-mode))

(use-package projectile
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode))

(use-package treemacs)
(use-package treemacs-evil
  : after (treemacs evil))

(use-package treemacs-projectile)

(use-package treemacs-all-the-icons
  :config
  (treemacs-load-theme "all-the-icons"))

(use-package lsp-treemacs
  :hook
  (lsp-mode . lsp-treemacs-sync-mode))

(use-package ccls
  :init
  (setq ccls-executable "/usr/bin/ccls"))

(use-package lsp-ui
  :hook
  (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))

(use-package flycheck
  :init
 (global-flycheck-mode))

(use-package subed
  :load-path "~/.config/emacs/elisp/subed"
  :hook
  (subed-mode . 'turn-on-auto-fill)
  (subed-mode . (lambda () (setq-local fill-column 40))))

(use-package ranger
 :bind
  ("C-c r" . ranger))

(use-package ivy
  :config
  (ivy-mode))

(use-package org)

;;Modeline customization



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" "234dbb732ef054b109a9e5ee5b499632c63cc24f7c2383a849815dacc1727cb6" "6c98bc9f39e8f8fd6da5b9c74a624cbb3782b4be8abae8fd84cbc43053d7c175" "da186cce19b5aed3f6a2316845583dbee76aea9255ea0da857d1c058ff003546" "a9a67b318b7417adbedaab02f05fa679973e9718d9d26075c6235b1f0db703c8" "7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae" "835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" "0feb7052df6cfc1733c1087d3876c26c66410e5f1337b039be44cb406b6187c6" "27a1dd6378f3782a593cc83e108a35c2b93e5ecc3bd9057313e1d88462701fcd" "f703efe04a108fcd4ad104e045b391c706035bce0314a30d72fbf0840b355c2c" default))
 '(global-hl-line-mode t)
 '(global-prettify-symbols-mode t)
 '(helm-minibuffer-history-key "M-p")
 '(ivy-mode t)
 '(org-agenda-files
   '("~/doc/facul/primeiro-semestre/sistemas-digitais/sistemas-digitais.org" "~/doc/facul/primeiro-semestre/topicos-de-matematica/topicos-de-matematica.org" "~/doc/org/packages.org"))
 '(org-format-latex-options
   '(:foreground default :background default :scale 1.25 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
		 ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(package-selected-packages
   '(doom-themes ivy ranger evil-collection tree-sitter-langs tree-sitter lsp-treemacs treemacs-all-the-icons treemacs treemacs-projectile company-box flycheck lsp-ui lsp-mode org-bullets bug-hunter centaur-tabs page-break-lines dashboard use-package))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


