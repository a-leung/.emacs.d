; Set colors
(set-background-color "black")
(set-foreground-color "white")
(set-cursor-color "white")
(transient-mark-mode t)
;(setq flyspell-issue-welcome-flag nil)

; Set column numbering
(column-number-mode 1)
(ido-mode t)

; Set Line number mode
;; (linum-mode 1)

(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(global-set-key "\C-w" 'backward-kill-word)
;(global-set-key "\C-x\C-k" 'kill-region)
;(global-set-key "\C-c\C-k" 'kill-region)

; Set RST options
(setq auto-mode-alist (cons '("\\.txt" . rst-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rst" . rst-mode) auto-mode-alist))

;from: http://snarfed.org/gnu_emacs_backup_files
;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("de538b2d1282b23ca41ac5d8b69c033b911521fe27b5e1f59783d2eb20384e1f" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(inhibit-startup-screen t)
 '(js-indent-level 2)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(visible-bell nil))

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

; set transparency
 (set-frame-parameter (selected-frame) 'alpha '(90 80))
 (add-to-list 'default-frame-alist '(alpha 90 80))

 ;; (set-frame-parameter (selected-frame) 'alpha '(95 80))
 ;; (add-to-list 'default-frame-alist '(alpha 95 80))

; set path to look in more than just /bin /usr/bin /sbin /usr/sbin
;(setq path "/home/acl/.rvm/gems/ruby-1.9.3-p448/bin:/home/acl/.rvm/gems/ruby-1.9.3-p448@global/bin:/home/acl/.rvm/rubies/ruby-1.9.3-p448/bin:/home/acl/.rvm/bin:/home/acl/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/acl/.rvm/bin")
;(setq path "/home/intern/.rvm/gems/ruby-1.9.3-p448/bin:/home/intern/.rvm/gems/ruby-1.9.3-p448@global/bin:/home/intern/.rvm/rubies/ruby-1.9.3-p448/bin:/home/intern/.rvm/bin:/home/intern/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/intern/.rvm/bin")
;(setenv "PATH" path)

; give windows unique names instead of just <2> etc.
(setq uniquify-buffer-name-style 'post-foward-angle-brackets)

; Mac only
; set Mac's command key as Meta key in emacs
;; key bindings
(when (eq system-type 'darwin) ;; mac specific settings
  ;; (setq mac-option-modifier 'alt)
  ;; (setq mac-command-modifier 'meta)
  ;; (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete

  (setq mac-option-key-is-meta nil)
  (setq mac-command-key-is-meta t)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier nil)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "unknown" :slant normal :weight normal :height 80 :width normal)))))
)

;; 80 for regular monitor
;; 190 for hdpi monitor
(custom-set-faces
 '(default ((t (:family "Inconsolata" :foundry "unknown" :slant normal :weight normal :height 120 :width normal)))))

; 130 for monitor
; 80 for external screen

(defun kill-line-or-region (beg end)
 "kill region if active only or kill line normally"
  (interactive "r")
  (if (region-active-p)
      (call-interactively 'kill-region)
    (call-interactively 'kill-line)))
  (global-set-key (kbd "C-k") 'kill-line-or-region)

(global-set-key (kbd "C-c o") 'occur)
(define-key isearch-mode-map (kbd "C-o") 'isearch-occur)

(global-set-key (kbd "C-M-J")
    (lambda () (interactive) (swap-with 'down)))
(global-set-key (kbd "C-M-K")
    (lambda () (interactive) (swap-with 'up)))
(global-set-key (kbd "C-M-H")
    (lambda () (interactive) (swap-with 'left)))
(global-set-key (kbd "C-M-L")
    (lambda () (interactive) (swap-with 'right)))

(global-set-key (kbd "M-J") (lambda () (interactive) (enlarge-window 1)))
(global-set-key (kbd "M-K") (lambda () (interactive) (enlarge-window -1)))
(global-set-key (kbd "M-H") (lambda () (interactive) (enlarge-window -1 t)))
(global-set-key (kbd "M-L") (lambda () (interactive) (enlarge-window 1 t)))
(global-set-key (kbd "M-j") 'windmove-down)
(global-set-key (kbd "M-k") 'windmove-up)
(global-set-key (kbd "M-h") 'windmove-left)
(global-set-key (kbd "M-l") 'windmove-right)

(global-set-key (kbd "C-x l") 'goto-line)
(global-set-key (kbd "C-x C-d") 'ido-dired)
(global-set-key (kbd "C-c C-w") 'whitespace-cleanup)

(global-set-key (kbd "C-c i") 'indent-region)
(global-set-key (kbd "C-c c") 'comment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)

;; Use node as our repl
(setq inferior-js-program-command "node")

;;;;;;;;;;;;;;;
;; highlights
; set highlight mode globally
(global-hl-line-mode 1)
; set highlight color (use (list-colors-mode) to see list)
(set-face-background 'hl-line "gray4")
; keep highlights off syntax colors
(set-face-foreground 'highlight nil)
(set-face-attribute 'region nil :background "blue4")

; match parenthesis
(show-paren-mode)

; make buffer names unique
(require 'uniquify)
(setq
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")

;; add some key support for ansi-term (and other terms)
(eval-after-load "term"
  '(progn
     (define-key term-raw-map (kbd "M-j") 'windmove-down)
     (define-key term-raw-map (kbd "M-k") 'windmove-up)
     (define-key term-raw-map (kbd "M-h") 'windmove-left)
     (define-key term-raw-map (kbd "M-l") 'windmove-right)

     (define-key term-raw-map (kbd "M-J") (lambda () (interactive) (enlarge-window 1)))
     (define-key term-raw-map (kbd "M-K") (lambda () (interactive) (enlarge-window -1)))
     (define-key term-raw-map (kbd "M-H") (lambda () (interactive) (enlarge-window -1 t)))
     (define-key term-raw-map (kbd "M-L") (lambda () (interactive) (enlarge-window 1 t)))
     (define-key term-raw-map (kbd "M-v") 'scroll-down)
     (define-key term-raw-map (kbd "C-v") 'scroll-up)
     ))

;; turn off UI stuff
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)

(require 'package)
(add-to-list 'package-archives
  '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)

;; nuke whitespaces when writing to a file
(add-hook 'before-save-hook 'whitespace-cleanup)

;; (add-hook 'after-init-hook #'global-flycheck-mode)
;; (eval-after-load 'flycheck
;;   '(progn
;;      (add-hook 'web-mode-hook '(lambda () (flycheck-mode -1)))
;;      (add-hook 'js-mode-hook '(lambda ()
;;                              (when (and
;;                                     (buffer-file-name)
;;                                     (string-match-p "\\.js\\.+$" (buffer-file-name)))
;;                                (flycheck-mode -1))))
;;      (when (file-exists-p "~/.rubocop.yml")
;;        (setq flycheck-rubocoprc "~/.rubocop.yml"))
;;      (setq flycheck-highlighting-mode 'lines)
;;      (setq flycheck-idle-change-delay 1)
;;      (setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers))))

;; automatically save buffers associated with files on buffer switch
;; and on windows switch
(defadvice switch-to-buffer (before save-buffer-now activate)
  (when buffer-file-name (save-buffer)))
(defadvice other-window (before other-window-now activate)
  (when buffer-file-name (save-buffer)))
(defadvice windmove-up (before other-window-now activate)
  (when buffer-file-name (save-buffer)))
(defadvice windmove-down (before other-window-now activate)
  (when buffer-file-name (save-buffer)))
(defadvice windmove-left (before other-window-now activate)
  (when buffer-file-name (save-buffer)))
(defadvice windmove-right (before other-window-now activate)
  (when buffer-file-name (save-buffer)))

;(add-to-list 'auto-mode-alist '("\\.erb\\" . web-mode)

; load theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'evenhold t)

(global-auto-revert-mode t)

; =================
; ruby/rails config
; =================
; via: http://lorefnon.me/2014/02/02/configuring-emacs-for-rails.html

(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
    '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)


; make it so RVM is usable in the shell
(add-to-list 'load-path
              "~/.emacs.d/plugins")
(require 'rvm)
(rvm-use-default) ;; use rvm's default ruby for the current Emacs session

(require 'yaml-mode)

(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(require 'robe)
(add-hook 'ruby-mode-hook 'robe-mode)

(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

(add-hook 'after-init-hook 'global-company-mode)
(global-company-mode t)
(push 'company-robe company-backends)

; start inf-ruby
; then start robe-start
; ala: https://github.com/dgutov/robe/issues/22
; add time to modeline
(display-time-mode 1)

;die tabs, die!
(setq-default indent-tabs-mode nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

; for hs-org mode binding!
(global-set-key "\C-ch" 'hs-org/minor-mode)

; set fill-column to be 80
(set-fill-column 80)

;; web-mode config
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-attr-indent-offset)
