;;; Commentary
;;; ui.el configure ui;;;
;;;Code:

(use-package ef-themes
  :defer t
  :init (load-theme 'ef-duo-light t))
;; icons
(use-package all-the-icons
  :if (display-graphic-p)
  )
(use-package nerd-icons)

;; tab bar
(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  :bind
  ("C-<left>" . centaur-tabs-backward)
  ("C-<right>" . centaur-tabs-forward))

;; font
(set-frame-font "Hack Nerd Font Mono 13")

;; modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode t)
  :custom
  (doom-modeline-enable-word-count t)
  )

;; rainbow-delimiters
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(provide 'ui)
;;; ui.el ends here
