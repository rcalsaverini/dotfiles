;; Dired

(add-hook 'dired-mode-hook 'dired-omit-mode)
(add-hook 'dired-mode-hook 'dired-hide-details-mode)
(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump)
	 ("M-RET"   . dired-display-file)))

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))


(setq dired-listing-switches "-laGho")
(require 'ls-lisp)
(setq ls-lisp-dirs-first t
      ls-lisp-use-insert-directory-program nil)
