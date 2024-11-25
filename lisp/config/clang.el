;;; clang config --- for C and C++
;;; Commentary:
;;; Code:


;; clang-format
(require 'clang-format)
(global-set-key (kbd "C-c i") 'clang-format-region)
(global-set-key (kbd "C-c u") 'clang-format-buffer)
(setq clang-format-fallback-style 'google)

(provide 'clang)
;;; clang.el ends here
