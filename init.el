;;; init.el --- Load the full configuration
;;; Code:

(require `package)
(setq package-archives `(("gnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu")
			 ("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

(eval-when-compile
  (require `use-package))

(load-theme `dracula t)

(add-to-list `load-path "~/.emacs.d/lisp")
(require `init-basic)

(provide `init)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
;;; init.el ends here
