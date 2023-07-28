;;; init-basic -- Some basic settings
;;; Code:
(electric-pair-mode t) ; auto complete bracket
(add-hook 'prog-mode-hook #'showparen-mode)
(tool-bar-mode -1)     ; disable tool bar
(global-display-line-numbers-mode 1) ; show line number

(provide `init-basic)

;;; init-basic ends here
