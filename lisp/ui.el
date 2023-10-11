;;; Commentary
;;; ui.el configure ui;;;
;;;Code:

;; theme
(use-package spacemacs-theme
  :defer t
  :init (load-theme 'tsdh-dark t))

;; icons
(use-package all-the-icons
  :if (display-graphic-p))

(use-package nerd-icons)

;; font
(set-frame-font "Hack Nerd Font Mono 13")

;; modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode t)
  :custom
  (doom-modeline-enable-word-count nil)
  )

;; rainbow-delimiters
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(provide 'ui)
;;; ui.el ends here
