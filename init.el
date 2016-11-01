; spacing
(setq-default indent-tabs-mode nil)  ; make tabs spaces
(setq-default set-fill-column 80)
(setq-default auto-fill-mode 1)
;; (set-fill-column 80) ;; set fill-column to be 80

; editing stuff
(global-set-key "\C-w" 'backward-kill-word) ; C-w kills last word

; navigating windows
(global-set-key (kbd "M-j") 'windmove-down)
(global-set-key (kbd "M-k") 'windmove-up)
(global-set-key (kbd "M-h") 'windmove-left)
(global-set-key (kbd "M-l") 'windmove-right)

(global-set-key (kbd "M-C-j") (lambda () (interactive) (enlarge-window 1)))
(global-set-key (kbd "M-C-k") (lambda () (interactive) (enlarge-window -1)))
(global-set-key (kbd "M-C-h") (lambda () (interactive) (enlarge-window -1 t)))
(global-set-key (kbd "M-C-l") (lambda () (interactive) (enlarge-window 1 t)))

;; add some key support for ansi-term (and other terms)
(eval-after-load "term"
  '(progn
     (define-key term-raw-map (kbd "M-j") 'windmove-down)
     (define-key term-raw-map (kbd "M-k") 'windmove-up)
     (define-key term-raw-map (kbd "M-h") 'windmove-left)
     (define-key term-raw-map (kbd "M-l") 'windmove-right)

     (define-key term-raw-map (kbd "M-C-j") (lambda () (interactive) (enlarge-window 1)))
     (define-key term-raw-map (kbd "M-C-k") (lambda () (interactive) (enlarge-window -1)))
     (define-key term-raw-map (kbd "M-C-h") (lambda () (interactive) (enlarge-window -1 t)))
     (define-key term-raw-map (kbd "M-C-l") (lambda () (interactive) (enlarge-window 1 t)))
     (define-key term-raw-map (kbd "M-v") 'scroll-down)
     (define-key term-raw-map (kbd "C-v") 'scroll-up)
     )
  )
;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)


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

;; cut line or selected region.
;; http://stackoverflow.com/a/8956311
(defun kill-line-or-region ()
  "kill region if active only or kill line normally"
  (interactive)
  (if (region-active-p)
      (call-interactively 'kill-region)
    (call-interactively 'kill-line)))
(global-set-key (kbd "C-k") 'kill-line-or-region)

;; commenting code:
(global-set-key (kbd "C-c c") 'comment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)

;; elpa packages
;; from: http://melpa.org/#/getting-started
(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))


;; set plugins directory

(add-to-list 'load-path "~/.emacs.d/plugins/")
(add-to-list 'load-path "~/.emacs.d/elpa/")

(set-cursor-color "white")

;; nuke whitespaces when writing to a file
(add-hook 'before-save-hook 'whitespace-cleanup)

;; auto revert buffer, even when git changes
(global-auto-revert-mode t)
(put 'downcase-region 'disabled nil)
