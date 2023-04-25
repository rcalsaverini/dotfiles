(defun rc/org/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))

(defun rc/org/org-mode-visual-fill ()
  (setq visual-fill-column-width 150
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))


(defun rc/org/org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.1)
                  (org-level-2 . 1.075)
                  (org-level-3 . 1.050)
                  (org-level-4 . 1.025)
                  (org-level-5 . 1.00)
                  (org-level-6 . 1.00)
                  (org-level-7 . 1.00)
                  (org-level-8 . 1.00)))
    (set-face-attribute (car face) nil :font "Roboto" :weight 'regular :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))


(setq rc/org-roam-directory (file-truename "~/org-roam/"))
(setq org-agenda-files '("~/.emacs.d/README.org" "~/org-roam/"))

;; Agenda configuration
(setq org-agenda-start-with-log-mode t)
(setq org-log-time 'time)
(setq org-log-done 'time)
(setq org-log-into-drawer t)
(setq org-todo-keywords
      '((sequence "BACKLOG" "REFINING" "TODO" "DOING" "REVIEWING" "|" "DONE" "DELEGATED" "CANCELED")))

(setq org-agenda-include-diary t)

(use-package org
  :hook (org-mode . rc/org/org-mode-setup)
  :config
  (setq org-ellipsis " ▾")
  (rc/org/org-font-setup)
  :custom
  (org-hide-emphasis-markers t))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode))

(use-package visual-fill-column
  :hook (org-mode . rc/org/org-mode-visual-fill))

(use-package org-roam
  :after org
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory rc/org-roam-directory)
  (org-roam-completion-everywhere t)
  (org-roam-dailies-capture-templates
   '(("d" "default" entry "* %<%I:%M %p>: %?"
      :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n"))))
  
  :bind (("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert)
	 :map org-mode-map
	 ("C-M-i" . completion-at-point)
	 :map org-roam-dailies-map
	 ("Y" . org-roam-dailies-capture-yesterday)
	 ("T" . org-roam-dailies-capture-tomorrow))
  :bind-keymap
  ("C-c n d" . org-roam-dailies-map)
  :config
  (require 'org-roam-dailies)
  (org-roam-db-autosync-mode))

(use-package org-roam-ui
  :after org-roam
  :ensure t)
