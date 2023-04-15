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

     "p"  '(:ignore p :which-key "project")
     "pd" '(project-dired :which-key "directory")
     "ps" '(project-shell :which-key "shell")

     "g"  '(:ignore g :which-key "git")
     "gs" '(magit-status :which-key "git status")

     "w"  '(:ignore w :which-key "window")
     "ws" '(evil-window-split :which-key "horizontal split")
     "wv" '(evil-window-vsplit :which-key "vertical split")
     "ww" '(evil-window-increase-width :which-key "increase width")
     "wh" '(evil-window-increase-height :which-key "increase height")
     "wn" '(evil-window-next :which-key "next")
     "wp" '(evil-window-prev :which-key "previous")
     "wd" '(evil-window-delete :which-key "delete window")

     "r"  '(:ignore r :which-key "org-roam")
     "ri" '(org-roam-node-insert :which-key "insert node")
     "rf" '(org-roam-node-find :which-key "find node")
     "rl" '(org-roam-node-list :which-key "list nodes")
     "rt" '(org-roam-tag-add :which-key "tag node")

     "d"  '(:ignore d :which-key "org-roam dailies")
     "dt" '(org-roam-dailies-goto-today :which-key "today")
     "df" '(org-roam-dailies-find-date :which-key "find date")
     "dc" '(org-roam-dailies-caputure-date :which-key "capture date")
     "dn" '(org-roam-dailies-goto-tomorrow :which-key "tomorrow")
     "dp" '(org-roam-dailies-goto-yesterday :which-key "yesterday")
     "dd" '(org-roam-dailies-find-directory :which-key "find dailies directory")))
