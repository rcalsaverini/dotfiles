;;; package --- Summary: my init file


;;; Commentary:

;;; Code:


(setq inhibit-startup-message t)
(setq inhibit-compacting-font-caches t)
(setq history-length 30)
(setq use-dialog-box nil)


(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(icomplete-mode 1)
(recentf-mode 1)                             ;; remeber recent files
(savehist-mode 1)                            ;; minibuffer prompt history ~M-n~ and ~M-p~ to navigate it
(save-place-mode 1)                          ;; remember which place in the file I was at
(global-auto-revert-mode 1)                  ;; auto-refresh file when changes on disk
(defvar global-auto-revert-non-file-buffers t) ;; Revert Dired and other buffers


;; manage backup files
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )


;;;;;;;;;;;;;;;;;;;
;; PACKAGE CONF  ;;
;;;;;;;;;;;;;;;;;;;
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;;;;;;;;;;;;;;;;;;;;
;;EXTERNAL FILES ;;
;;;;;;;;;;;;;;;;;;;

(setq custom-file (locate-user-emacs-file "custom.el"))              ;; Keep a separate custom.el
(load custom-file 'noerror 'nomessage)                               ;;
(load-file (locate-user-emacs-file "init.performance.el"))           ;; Performance improvements
(load-file (locate-user-emacs-file "init.quelpa.el"))                ;; Use quelpa to fetch packages from git
(load-file (locate-user-emacs-file "init.theme.el"))                 ;; Theme and appearance
(load-file (locate-user-emacs-file "init.dired.el"))                 ;; Dired
(load-file (locate-user-emacs-file "init.vertico.el"))               ;; Vertico completion and related packages
(load-file (locate-user-emacs-file "init.git.el"))                   ;; Magit and Projectile
(load-file (locate-user-emacs-file "init.org.el"))                   ;; Org
(load-file (locate-user-emacs-file "init.key.el"))                   ;; Key-mappings
(load-file (locate-user-emacs-file "init.meow.el"))                  ;; Meow
(load-file (locate-user-emacs-file "init.ide.el"))                   ;; Programming utilities
;; (load-file (locate-user-emacs-file "init.python.el"))             ;; Python package
(load-file (locate-user-emacs-file "init.haskell.el"))               ;; Haskell package

(provide 'init)
;;; init.el ends here
