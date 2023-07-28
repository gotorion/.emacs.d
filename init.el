;;; init.el --- Load the full configuration
;;; Code:
(let ((minver "25.1"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config require v%s or higher" minver)))

(add-to-list `load-path "~/.emacs.d/lisp")
(require `init-basic)

(provide `init)
;;; init.el ends here
