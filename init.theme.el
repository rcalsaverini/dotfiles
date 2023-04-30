
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
      modus-themes-syntax '(faint green-strings yellow-comments))


;; set the font face
(set-face-attribute 'default nil
		    :weight 'light
		    :height 120
		    :font "Fira Code")

(set-face-attribute 'fixed-pitch nil
		    :inherit 'default
		    :font "Fira Code")

(set-face-attribute 'variable-pitch nil
		    :inherit 'default
		    :font "Lucida Grande")


;; Load the dark theme by default
(load-theme 'modus-vivendi t)

(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1))

(use-package all-the-icons
  :ensure t)

(use-package all-the-icons-dired
  :ensure t
  :config
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))
