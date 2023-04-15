(setq inhibit-startup-message t)
(setq inhibit-compacting-font-caches t)
(setq history-length 30)
(setq use-dialog-box nil)


(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode 1)
(icomplete-mode 1)
(recentf-mode 1)                             ;; remeber recent files
(savehist-mode 1)                            ;; minibuffer prompt history ~M-n~ and ~M-p~ to navigate it 
(save-place-mode 1)                          ;; remember which place in the file I was at
(global-auto-revert-mode 1)                  ;; auto-refresh file when changes on disk
(setq global-auto-revert-non-file-buffers t) ;; Revert Dired and other buffers


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


;;;;;;;;;;;;;;;;;;;
;;EXTERNAL FILES ;;
;;;;;;;;;;;;;;;;;;;

(setq custom-file (locate-user-emacs-file "custom.el"))              ;; Keep a separate custom.el
(load custom-file 'noerror 'nomessage)                               ;;
(load-file (locate-user-emacs-file "init.performance.el"))           ;; Performance improvements
(load-file (locate-user-emacs-file "init.theme.el"))                 ;; Theme and appearance
(load-file (locate-user-emacs-file "init.key.el"))                   ;; Key-mappings 
(load-file (locate-user-emacs-file "init.vertico.el"))               ;; Vertico completion and related packages
(load-file (locate-user-emacs-file "init.git.el"))                   ;; Magit and Projectile
(load-file (locate-user-emacs-file "init.org.el"))                   ;; Org
