;;; package --- Summary: python related packages

;;; Commentary:

;;; Code:

(use-package elpy
  :init
  (elpy-enable))

(use-package python-mode
  :ensure t)

(use-package ein
  :ensure t)

(use-package pyvenv
  :init
  (add-hook 'python-mode-hook 'pyvenv-mode))

(defvar elpy-rpc-backend "jedi")
(setq elpy-rpc-python-command "python")
(setq elpy-rpc-timeout 2)

(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(python-pylint)))

(setq-default flycheck-enabled-checkers
              (append flycheck-enabled-checkers
                      '(python-mypy)))
