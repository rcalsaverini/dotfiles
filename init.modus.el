
;; Configure the Modus Themes' appearance
(setq modus-themes-mode-line '(accented borderless padded)
      modus-themes-bold-constructs t
      modus-themes-italic-constructs t
      modus-themes-fringes 'subtle
      modus-themes-tabs-accented t
      modus-themes-paren-match '(bold intense)
      modus-themes-prompts '(bold intense)
      modus-themes-completions 'opinionated
      modus-themes-org-blocks 'tinted-background
      modus-themes-scale-headings t
      modus-themes-region '(bg-only)
      modus-themes-syntax '(faint green-strings yellow-comments)
      modus-themes-headings
      '((1 . (rainbow overline background 1.4))
        (2 . (rainbow background 1.3))
        (3 . (rainbow bold 1.2))
        (t . (semilight 1.1))))


;; Load the dark theme by default
(load-theme 'modus-vivendi t)

;; set the font face

(set-face-attribute 'default nil
		    :font   "Fira Code"
		    :weight 'normal
		    :height 170)
