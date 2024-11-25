;;; ui.el --- better ui
;;; Commentary:
;;; Code:

(use-package ef-themes
  :defer t
  :init (load-theme 'ef-bio))
;; icons
(use-package all-the-icons
  :if (display-graphic-p)
  )

(use-package nerd-icons
  :custom
  (nerd-icons-set-font "Hack Nerd Font Mono"))

;; tab bar
(use-package centaur-tabs
  :demand
  :init (centaur-tabs-mode t)
  :config
  (setq centaur-tabs-set-icons t)
  :bind
  ("C-<left>" . centaur-tabs-backward)
  ("C-<right>" . centaur-tabs-forward))

;; font
(set-frame-font "Hack Nerd Font Mono 13")

;; modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode t)
  :config
  (progn
    (setq doom-modeline-hud t
	  doom-modeline-icon t
	  doom-modeline-major-mode-icon t
	  doom-modeline-major-mode-color-icon t
	  doom-modeline-buffer-state-icon t
	  doom-modeline-buffer-modification-icon t
	  doom-modeline-unicode-fallback t
	  doom-modeline-position-column-format '("C%c")
	  doom-modeline-lsp t
	  display-time-mode t
	  doom-modeline-time t
	  ))
    )

;; rainbow-delimiters
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(provide 'init-ui)
;;; ui.el ends here
