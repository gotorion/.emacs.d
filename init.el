;;; init.el --- Load the full configuration
;;; Commentary:
;;; Code:
(setq url-proxy-services `(("http" . "127.0.0.1:7890")))
(add-to-list `load-path "~/.emacs.d/lisp")
(require `basic)
(require 'packages)

;; install theme
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-xcode t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-xcode") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; lsp-mode
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l"
	lsp-auto-configure t
	lsp-auto-guess-root t
	lsp-idle-delay 0.500
  )
  :hook (
	 ((c++-mode
	   c-mode
	   ) . lsp)
	 (lsp-mode . lsp-enable-which-key-integration)
	 )
  :commands lsp)
(use-package lsp-ui
  :after (lsp-mode)
  :commands (lsp-ui-mode)
  :bind
  (:map lsp-ui-mode-map
	([remap xref-find-references] . lsp-ui-peek-find-references)
	([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
	("C-c u" . lsp-ui-imenu))
  :hook (lsp-mode . lsp-ui-mode)
  :init
  (setq lsp-enable-symbol-highlighting t
	lsp-ui-doc-enable t
	lsp-lens-enable t)
  )
;; modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; magit
(use-package magit)
;; helm
(package-install 'helm)
(use-package helm
  :bind (("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files))
  :config
  (helm-mode 1))

(use-package company
  :hook (after-init . global-company-mode)
  :config
  (setq company-tooltip-align-annotations t
	company-tooltip-limit 20
	company-show-numbers t
	company-idle-delay .2
	company-minimum-prefix-length 1))
(use-package flycheck
  :init
  (setq flycheck-emacs-lisp-load-path `inherit)
  :config
  (global-flycheck-mode))

(provide `init)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
;;; init.el ends here
