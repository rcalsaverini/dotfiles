(use-package which-key
  :ensure t
  :diminish which-key-mode
  :init (which-key-mode)
  :config
  (setq which-key-idle-delay 0))

(use-package general
  :config
  
  (general-create-definer rune/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")
   
  (general-define-key :keymaps 'override 
		      "C-h b"      'embark-bindings))


(defun rc/meow/motion-state-keymap ()
  (meow-motion-overwrite-define-key
   '("j" . meow-next)
   '("k" . meow-prev)
   '("<escape>" . ignore)))

(defun rc/meow/leader-state-keymap ()
  (meow-leader-define-key
   ;; SPC j/k will run the original command in MOTION state.
   '("j" . "H-j")
   '("k" . "H-k")
   ;; embark
   '("." . embark-act)
   '(";" . embark-dwim)

   ;; consult
   '("c f" . consult-find)
   '("c g" . consult-ripgrep)
   '("c x " . consult-mode-command)

   ;; dired/project
   '("d" . dired)
   '("p d" . project-dired)
   '("p s" . project-shell)
   '("p e" . project-eshell)
   '("p b" . consult-project-buffer)
   '("p f" . project-find-file)
   '("p p" . project-switch-project)

   ;; window
   '("w h" . split-window-horizontally)
   '("w v" . split-window-vertically)
   '("w n" . next-window-any-frame)
   '("w p" . previous-window-any-frame)

   ;; truncate / wrap
   '("t t" . toggle-truncate-lines)
   '("t w" . toggle-word-wrap)
   
   ;; denote
   '("n" . denote)
   
   ;; Use SPC (0-9) for digit arguments.
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument)
   '("/" . meow-keypad-describe-key)
   '("?" . meow-cheatsheet)))

(defun rc/meow/normal-state-keymap ()
  (meow-normal-define-key
   '("0" . meow-expand-0)
   '("9" . meow-expand-9)
   '("8" . meow-expand-8)
   '("7" . meow-expand-7)
   '("6" . meow-expand-6)
   '("5" . meow-expand-5)
   '("4" . meow-expand-4)
   '("3" . meow-expand-3)
   '("2" . meow-expand-2)
   '("1" . meow-expand-1)


   ;; repeat last command
   '("'" . repeat)
   
   ;; window 
   '("q" . meow-quit)
   
  
   ;; mode change
   '("i" . meow-insert)
   '("c" . meow-change)
   
   ;; append
   '("a" . meow-append)
   '("A" . meow-open-below)
   '("I" . meow-open-above)

   ;; selection
   '("g" . meow-cancel-selection)

   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("[" . meow-beginning-of-thing)
   '("]" . meow-end-of-thing)
    
   '("t" . meow-till)   

   '("b" . meow-block)
   '("B" . meow-to-block) 
   '("W" . meow-mark-word)
   '("S" . meow-mark-symbol)
   '("l" . meow-line)

   ;; movement
   '("e" . meow-back-word)
   '("E" . meow-back-symbol)
   '("w" . meow-next-word)
   '("s" . meow-next-symbol)

   ;; delete
   '("d" . meow-delete)
   '("D" . meow-backward-delete)

   ;; copy&paste
   '("p" . meow-yank)
   '("k" . meow-kill)
   '("y" . meow-save)
 
   ;; undo
   '("u" . meow-undo)
   '("U" . meow-undo-in-selection)
  
   ;; ignore
   '("<escape>" . ignore)))
