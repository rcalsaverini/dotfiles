
(use-package meow)

(defun meow-setup ()
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
  (rc/meow/motion-state-keymap)
  (rc/meow/leader-state-keymap)
  (rc/meow/normal-state-keymap))

(require 'meow)
(meow-setup)
(meow-global-mode 1)
