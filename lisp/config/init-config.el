;;; init.el --- Load the full configuration
;;; Commentary:
;;; Code:

(require 'package)
(setq package-archives '(("gnu"    . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                          ("nongnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                          ("melpa"  . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(setq package-check-signature nil)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(eval-when-compile
  (require 'use-package))

(setq gc-cons-threshold most-negative-fixnum)

(require 'basic)
(require 'keybindings)
(require 'tools)
(require 'init-ui)
(require 'helm-conf)
(require 'clang)

;; lsp-mode
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l"
	lsp-auto-configure t
	lsp-auto-guess-root t
	lsp-idle-delay 0.200
	lsp-headerline-breadcrumb-enable nil
  )
  :hook (
	 ((c++-mode
	   c-mode
	   python-mode
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
;;(package-install 'helm)
;;(use-package helm
;;  :bind (("M-x" . helm-M-x)
;;	 ("C-x C-f" . helm-find-files))
;;  :config
;;  (helm-mode t))

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

(provide `init-config)

;; (setq custom-file "~/.emacs.d/custom.el")
;; (load custom-file)
;;; init.el ends here
