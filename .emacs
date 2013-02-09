(add-to-list 'default-frame-alist '(font . "Menlo-12")) ;; font size
;;(setq mac-command-modifier 'ctrl) ;; make command key ctrl
;;(setq mac-function-modifier 'super)
(setq ispell-program-name "/usr/local/bin/aspell")
(setq-default word-wrap t)
(global-visual-line-mode)
(setq column-number-mode t)
(load-file "~/dotfiles/elisp/macgreek.el")
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.text" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.mdwn" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.mdt" . markdown-mode) auto-mode-alist))

(defun ask-before-closing ()
  "Ask whether or not to close, and then close if y was pressed"
  (interactive)
  (if (y-or-n-p (format "Are you sure you want to exit Emacs? "))
      (save-buffers-kill-emacs))
    (message "Canceled exit"))


(global-set-key (kbd "C-x C-c") 'ask-before-closing)

(show-paren-mode 1)

(global-linum-mode 0)

;;(blink-cursor-mode 0)

;; (setq
;;   scroll-conservatively 100000
;;   scroll-preserve-screen-position t)

(setq-default cursor-type 'bar)
(load-theme 'tango-dark t)
(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))
(setq mouse-sel-mode t)
(global-set-key [mouse-4] '(lambda ()
			     (interactive)
			     (scroll-down 1)))
(global-set-key [mouse-5] '(lambda ()
			     (interactive)
			     (scroll-up 1)))
