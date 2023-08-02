;;; basic -- Some basic settings
;;; Code:
(electric-pair-mode t) ; auto complete bracket
(add-hook 'prog-mode-hook #'show-paren-mode)
(menu-bar-mode -1)
(tool-bar-mode -1)     ; disable tool bar
(global-display-line-numbers-mode 1) ; show line number

;; disable backup and auto save
(setq make-backup-files nil)


(provide `basic)

;;; basic ends here
