;;; init.el --- Load the full configuration
;;; Commentary:
;;; Code:
;; (setq url-proxy-services `(("http" . "127.0.0.1:7890")))
(add-to-list `load-path "~/.emacs.d/lisp")

(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
	    (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

(require 'basic)
(require 'packages)
(require 'keybindings)
(require 'tools)
(require 'ui)

;; lsp-mode
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l"
	lsp-auto-configure t
	lsp-auto-guess-root t
	lsp-idle-delay 0.200
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
	company-minimum-prefix-length 2))
(use-package flycheck
  :init
  (setq flycheck-emacs-lisp-load-path `inherit)
  :config
  (global-flycheck-mode))

(provide `init)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
;;; init.el ends here
