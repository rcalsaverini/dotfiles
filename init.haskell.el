
(use-package haskell-mode)
(use-package dante)
(use-package haskell-snippets)
(use-package hlint-refactor)
;;(use-package intero)
(add-to-list 'auto-mode-alist '("\\.hs\\'" . haskell-mode))
(add-hook 'haskell-mode-hook 'dante-mode)
(add-hook 'haskell-mode-hook 'hlint-refactor-mode)
;;(add-hook 'haskell-mode-hook 'intero-mode)
