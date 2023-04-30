;;; package --- development related functions and packages


;;; Commentary:
;;; This file contains the needed functions for software development with Emacs.


;;; Code:

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package flycheck)
(global-flycheck-mode)
(use-package exec-path-from-shell)
(exec-path-from-shell-initialize)

(provide 'init.ide)
;;; init.ide.el ends here
