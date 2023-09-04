(use-package vterm
  :ensure t)
;; switch window fast
(use-package ace-window
  :ensure t
  :init
  (progn
    (setq aw-scope 'global)
    (global-set-key (kbd "M-o") 'ace-window)
    )
  )

;; which-key
(use-package which-key
  :diminish which-key-mode
  :config
  (which-key-mode))

(use-package smartparens)
(provide 'tools)
