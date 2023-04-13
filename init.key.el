(use-package which-key
  :ensure t
  :diminish which-key-mode
  :init (which-key-mode)
  :config
  (setq which-key-idle-delay 0))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  )

(use-package general
  :config
  (general-create-definer rune/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (rune/leader-keys
     "t"  '(:ignore t :which-key "toggles")
     "tw" '(toggle-word-wrap :which-key "word wrap")
     "tt" '(toggle-truncate-lines :which-key "truncate lines")
     "p" '(:ignore p :which-key "project")
     "pd" '(projectile-dired :which-key "directory")
     "ps" '(projectile-run-shell :which-key "shell")))
