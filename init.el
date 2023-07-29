;;; init.el --- Load the full configuration
;;; Commentary:
;;; Code:

(require `package)
(setq package-archives `(("gnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

(unless (package-installed-p `use-package)
  ;; update local cache
  (package-refresh-contents)
  (package-install `use-package))
(eval-when-compile
  (require `use-package))
(setq user-package-always-ensure t)

;; install theme
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-gruvbox t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-gruvbox") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; magit
(use-package magit)

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



(add-to-list `load-path "~/.emacs.d/lisp")
(require `basic)

(provide `init)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
;;; init.el ends here
