;;; ui.el configure ui
;;; Commentary
;;; Code:

;; theme
(use-package spacemacs-theme
  :defer t
  :init (load-theme 'spacemacs-light t))

;; modeline
(use-package all-the-icons)
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
)
;; rainbow-delimiters
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))
(provide 'ui)
;;; ui.el ends here
