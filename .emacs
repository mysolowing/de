(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/plugins/single-files")
(require 'eval-after-load)
(load-file "~/.emacs.d/plugins/cedet-1.1/common/cedet.el")
(global-ede-mode 1)                      ; Enable the Project management system
(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion
(global-srecode-minor-mode 1)            ; Enable template insertion menu
(global-unset-key [(f10)]) (global-set-key [(f10)] (lambda() (interactive) (find-file "~/.emacs.d/my_key_settings.el")))
(global-unset-key [(f11)]) (global-set-key [(f11)] (lambda() (interactive) (find-file "~/.emacs.d/.emacs")))
(global-set-key [(f12)] (lambda() (interactive)(save-some-buffers (buffer-file-name)) (eval-buffer))) ;; evaluate buffer

;; ========= Modes ==========
(global-linum-mode t)
;; (ido-mode t)
(delete-selection-mode t)
(visual-line-mode 1)
(setq transient-mark-mode t)
(setq which-function-mode t)
(global-font-lock-mode t)        ;Syntax highlight
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(icomplete-mode t);; icomplete mode in minibuffer
(iswitchb-mode t)
;; (blink-cursor-mode t)
;;(pc-selection-mode t)
;(shift-select-mode t)
;; ========= Varibles ==========
(setq kill-ring-max 2000);; Set delete record
(setq-default tab-width 4)
(add-hook 'before-save-hook
          '(lambda () ;;create directory before saving
             (or (file-exists-p (file-name-directory buffer-file-name))
                 (make-directory (file-name-directory buffer-file-name) t))))
(setq hippie-expand-verbose t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; (add-hook 'before-save-hook 'delete-blank-lines)
(setq visual-bell -1)  ;;; Disable system beep
(auto-image-file-mode t)
(setq enable-recursive-minibuffers t)
(setq kill-whole-line t) ;; C-k kill whole line including lind end
(require 'tramp)
(setq tramp-default-method "ssh")
(setq initial-major-mode 'org-mode)
(setq initial-scratch-message nil)
(setq column-number-mode t)   ;; Display Cursor Location
(setq line-number-mode t)
(setq display-time-12hr-format t);;;; Display Time
(setq display-time-day-and-date t)
(display-time)
(setq inhibit-startup-message t)  ;; Disable Startup Message
(mouse-wheel-mode t)    ;; Response to mouse scrolling
(setq-default make-backup-files t)
(setq-default make-temp-files t)
(setq auto-save-default t)  ; disable # files%p
(auto-save-mode t)
(setq kept-new-versions 10 ;; Enable versioning with modified values
      kept-old-versions 5
      version-control t
      delete-old-versions t
      backup-by-copying t)
(setq backup-directory-alist (quote ((".*" . "~/.emacs.d/auto-save-list"))))  ;; Save all backup file in this directory.
(global-set-key "\C-k" 'kill-whole-line)
(setq temporary-file-directory  "~/.emacs.d/temp-list")
(setq-default fill-column 72)    ;; Set Fill Column and auto fill
(setq auto-fill-mode 1)
(setq scroll-margin 3  scroll-conservatively 10000)
(fset 'yes-or-no-p 'y-or-n-p)  ;; ask by y or n
(setq frame-title-format (list "%b %p  [%f] " (getenv "USERNAME") " %s %Z   " emacs-version))
(setq standard-indent 2)
(remove-hook 'coding-hook 'turn-on-hl-line-mode)
;;----------------------------------------------------------------------
;; (add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
;; (require 'yas-jit)
;; (setq yas/root-directory "~/.emacs.d/plugins/yasnippet")
;; (yas/jit-load)

;;----------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete-131")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete-131/ac-dict")
(ac-config-default)
(require 'auto-complete-extension)
;;----------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme-660")
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme-660/themes")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-hober)))
;; (color-theme-sons-of-obsidian)
(color-theme-arjen)
;;----------------------------------------------------------------------
(require 'cursor-chg)  ; Load the library
(toggle-cursor-type-when-idle 1) ; Turn on cursor change when Emacs is idle
(change-cursor-mode 1) ; Turn on change for overwrite, read-only, and input mode
(curchg-change-cursor-when-idle-interval 10) ; change the idle timer
;; ========= org mode ==========
(setq load-path (cons "~/.emacs.d/plugins/org-7.9.1/lisp" load-path))
(setq load-path (cons "~/.emacs.d/plugins/org-7.9.1/contrib/lisp" load-path))
(require 'org-install)
(setq org-support-shift-select t)
;(require 'org-mode)
; Some initial langauges we want org-babel to support
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (sh . t)
   (python . t)
   (R . t)
   (ruby . t)
   (ditaa . t)
   (dot . t)
   (octave . t)
   (sqlite . t)
   (perl . t)
   ))
; Add short cut keys for the org-agenda
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-export-as-html-and-open)

;; ================== icicles =====================
(add-to-list 'load-path "~/.emacs.d/plugins/icicles")
(require 'icicles)
;;----------------------------------------------------------------------

(require 'dired-lis)
(require 'smart-compile)
(require 'compile-dwim)
(require 'smart-operator)
(require 'autopair) (autopair-global-mode t) ;; to enable in all buffers
(require 'auto-pair+)
(require 'highlight-sexp)
(require 'icomplete+)
(require 'buffcycle)
;(require 'kill-ring-ido)
(require 'browse-kill-ring+)
;; (global-set-key "\M-q" 'iswitchb-kill-buffer)
(global-set-key "\M-q" ( lambda() (interactive)(kill-buffer (current-buffer))))
(global-set-key "\M-b" 'kill-this-buffer-if-not-scratch)
(load-file "~/.emacs.d/my_key_settings.el")
(require 'maxframe) (maximize-frame)
;(if (eq window-system 'w32) (emacs-maximize) )
;(global-set-key "\C-q" 'comment-dwim-line)

;(setq initial-frame-alist '((top . 0) (left . 0) (width . 80) (height . 30)))
