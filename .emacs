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

;; (add-hook 'c-mode-common-hook
;;   (lambda() 
;;     (local-set-key  (kbd "C-c o") 'ff-find-other-file)))

;; --- Obj-C switch between header and source ---

(defun objc-in-header-file ()
  (let* ((filename (buffer-file-name))
         (extension (car (last (split-string filename "\\.")))))
    (string= "h" extension)))

(defun objc-jump-to-extension (extension)
  (let* ((filename (buffer-file-name))
         (file-components (append (butlast (split-string filename
                                                         "\\."))
                                  (list extension))))
    (find-file (mapconcat 'identity file-components "."))))

;;; Assumes that Header and Source file are in same directory
(defun objc-jump-between-header-source ()
  (interactive)
  (if (objc-in-header-file)
      (objc-jump-to-extension "m")
    (objc-jump-to-extension "h")))

(defun objc-mode-customizations ()
  (define-key objc-mode-map (kbd "C-c o") 'objc-jump-between-header-source))

(add-hook 'objc-mode-hook 'objc-mode-customizations)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(add-to-list 'auto-mode-alist '("\\.mm\\'" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . objc-mode))
