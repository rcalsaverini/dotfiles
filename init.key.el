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
     "t"    '(:ignore t                     :which-key "toggles")
     "tw" '(toggle-word-wrap :which-key "word wrap")
     "tt" '(toggle-truncate-lines :which-key "truncate lines")

     "p"  '(:ignore p :which-key "project")
     "p d" '(project-dired :which-key "directory")
     "p s" '(project-shell :which-key "shell")

     "g"  '(:ignore g :which-key "git")
     "g s" '(magit-status :which-key "git status")

     "w"  '(:ignore w :which-key "window")
     "w s" '(evil-window-split :which-key "horizontal split")
     "w v" '(evil-window-vsplit :which-key "vertical split")
     "w w" '(evil-window-increase-width :which-key "increase width")
     "w h" '(evil-window-increase-height :which-key "increase height")
     "w n" '(evil-window-next :which-key "next")
     "w p" '(evil-window-prev :which-key "previous")
     "w d" '(evil-window-delete :which-key "delete window")

     "o"     '(:ignore o :which-key "org-mode")     
     
     "o r"   '(:ignore r :which-key "org-roam")
     "o r i" '(org-roam-node-insert :which-key "insert node")
     "o r f" '(org-roam-node-find :which-key "find node")
     "o r l" '(org-roam-node-list :which-key "list nodes")
     "o r t" '(org-roam-tag-add :which-key "tag node")

     "o d"   '(:ignore d :which-key "org-roam dailies")
     "o d t" '(org-roam-dailies-goto-today :which-key "today")
     "o d f" '(org-roam-dailies-find-date :which-key "find date")
     "o d c" '(org-roam-dailies-caputure-date :which-key "capture date")
     "o d n" '(org-roam-dailies-goto-tomorrow :which-key "tomorrow")
     "o d p" '(org-roam-dailies-goto-yesterday :which-key "yesterday")
     "o d d" '(org-roam-dailies-find-directory :which-key "find dailies directory")

     "o a" '(:ignore a :which-key "agenda")
     "o a a" '(org-agenda-list :which-key "open agenda")
     "o a s" '(org-schedule :which-key "schedule item")
     "o a t" '(org-time-stamp :which-key "time stamp item")
     "o a d" '(org-deadline :which-key "set deadline")))

(general-define-key :keymaps 'override 
		    "M-y"    'consult-yank-pop
		    "C-."    'embark-act
		    "C-;"    'embark-dwim
		    
		    "C-x b"   'consult-buffer 
		    "C-x p b" 'consult-project-buffer
		    "C-x f"   'consult-find
		    
		    :prefix "M-s"
		    "u"      'consult-focus-lines
		    "g"      'consult-ripgrep
		    
		    :prefix "C-c"
		    "M-x"    'consult-mode-command
		    
		    :prefix "C-h"
		    "b"      'embark-bindings)
