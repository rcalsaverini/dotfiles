(setq inhibit-startup-message t)
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
(setq global-auto-revert-non-file-buffers t) ;; Revert Dired and other buffers



;;;;;;;;;;;;;;;;;;;
;;EXTERNAL FILES ;;
;;;;;;;;;;;;;;;;;;;

(setq custom-file (locate-user-emacs-file "custom.el"))              ;; change location of custom variables to avoid
                                                                     ;;     zuating my init.el file
(load custom-file 'noerror 'nomessage)                               ;;
(load-file (locate-user-emacs-file "init.performance.el"))           ;; performance improvements
(load-file (locate-user-emacs-file "init.modus.el"))                 ;; load the modus theme and appearance options

