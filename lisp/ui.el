;;; ui.el configure ui
;;; Commentary
;;; Code:

;; theme
(use-package spacemacs-theme
  :defer t
  :init (load-theme 'leuven t))

;; icons
(use-package nerd-icons)
;; font
(set-frame-font "Hack Nerd Font Mono 13")
;; modeline

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom
  (doom-modeline-enable-word-count nil)
)
;; rainbow-delimiters
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))
(provide 'ui)
;;; ui.el ends here
