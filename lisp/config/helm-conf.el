;;; helm config
;;; Commentary:
;;; Code:

;; helm
(package-install 'helm)
(use-package helm
  :bind (
    ("M-x"          . helm-M-x)
	("C-x C-f"      . helm-find-files)
    )
  :config
  (helm-mode t)
  )

(provide 'helm-conf)
;;; helm.el ends here
