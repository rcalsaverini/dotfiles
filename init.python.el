(use-package flycheck
  :ensure t)


(use-package elpy
  :init
  (elpy-enable))

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package python-mode
  :ensure t)

(use-package ein
  :ensure t)

(use-package anaconda-mode
  :ensure t
  :init
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))

(use-package company-anaconda
  :ensure t
  :init
  (eval-after-load "company"
    '(add-to-list 'company-backends 'company-anaconda)))

(use-package conda
  :ensure t)

(setq anaconda-mode-conda-executable "/Users/rafael.calsaverini/miniforge3/condabin/conda")

(setq elpy-rpc-backend "jedi")
(setq elpy-rpc-python-command "python")
(setq elpy-rpc-timeout 2)

(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(python-pylint)))

(setq-default flycheck-enabled-checkers
              (append flycheck-enabled-checkers
                      '(python-mypy)))

(setq-default mode-line-format
              '("%e"
                (:eval
                 (when (anaconda-mode-active-p)
                   (concat " [" (anaconda-mode-current-environment) "]")))))
