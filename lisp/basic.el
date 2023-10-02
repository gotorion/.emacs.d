;;; basic -- Some basic settings
;;; Code:
(electric-pair-mode t) ; auto complete bracket
(add-hook 'prog-mode-hook #'show-paren-mode)
(menu-bar-mode -1)
;;(tool-bar-mode -1)     ; disable tool bar(emacs-nox not work)
(global-display-line-numbers-mode 1) ; show line number
(blink-cursor-mode nil) ;; on X Window
(setq visible-cursor nil) ;; on Console
;; set yes-or-no to y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; set tab
(setq-default indent-tabs-mode t)
(setq default-tab-width 2)
(dolist (hook (list
	       'c++-mode
	       'c-mode
	       'python-mode))
(add-hook hook '(lambda () (setq indent-tabs-mode)))
  )
;; disable backup and auto save
(setq make-backup-files nil)
(setq auto-save-default nil)

(provide `basic)

;;; basic ends here
