(add-to-list 'default-frame-alist '(font . "Menlo-12")) ;; font size
;;(setq mac-command-modifier 'ctrl) ;; make command key ctrl
;;(setq mac-function-modifier 'super)
(setq ispell-program-name "/usr/local/bin/aspell")
(setq-default word-wrap t)
(global-visual-line-mode)
(setq column-number-mode t)
;;(load-file "~/dotfiles/elisp/macgreek.el")
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
;;(load-theme 'tango-dark t)
;;(load-theme 'manoj-dark t)
;;(load-theme 'tsdh-dark t)
;;(load-theme 'wheatgrass t)
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



(setq c-mode-hook
    (function (lambda ()
                (setq indent-tabs-mode nil)
                ;;(setq c-indent-level 4)
                (setq-default indent-tabs-mode nil))))
                ;;(local-set-key (kbd "RET") 'newline-and-indent))))
                ;;(local-set-key (kbd "RET") 'comment-indent-new-line)


(setq objc-mode-hook
    (function (lambda ()
                (setq indent-tabs-mode nil)
                ;;(setq c-indent-level 4)
                (setq-default indent-tabs-mode nil)
                ;;(local-set-key (kbd "RET") 'newline-and-indent)
                ;;(local-set-key (kbd "RET") 'comment-indent-new-line)
                (local-set-key (kbd "C-c o") 'objc-jump-between-header-source))))

(setq c++-mode-hook
    (function (lambda ()
                (setq indent-tabs-mode nil)
                ;;(setq c-indent-level 4)
                (setq-default indent-tabs-mode nil))))
                ;;(local-set-key (kbd "RET") 'newline-and-indent))))
                ;;(local-set-key (kbd "RET") 'comment-indent-new-line)


(add-hook 'lisp-mode-hook '(lambda ()
                             (setq-default indent-tabs-mode nil)     
      ;;(local-set-key (kbd "RET") 'newline-and-indent)))
      ;;(local-set-key (kbd "RET") 'comment-indent-new-line)
))


(setq-default indent-tabs-mode nil)
(setq c-basic-offset 4)

(setq-default read-buffer-completion-ignore-case 1)
(global-subword-mode 1)

(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/elpa")
(add-to-list 'load-path "~/.emacs.d/elpa/tron-theme-12")
(add-to-list 'load-path "~/.emacs.d/vmalloc-emacs/themes")

;;(load-theme 'pastels-on-dark t)

;;(load-theme 'tron t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("54d1bcf3fcf758af4812f98eb53b5d767f897442753e1aa468cfeb221f8734f9" "058eeda70c6a8e702da4c7037c582f727887f5ab49a401247eac40aece97060d" "4d66773cc6d32566eaf2c9c7ce11269d9eb26e428a1a4fa10e97bae46ff615da" "5e2ade7f65d9162ca2ba806908049fb37d602d59d90dc3a08463e1a042f177ae" "d6a00ef5e53adf9b6fe417d2b4404895f26210c52bb8716971be106550cea257" "59f5e4dd9d81db10b80a6dcbe3b3411693ce99f96dfbdbaaf210d631315451e3" "0b2e94037dbb1ff45cc3cd89a07901eeed93849524b574fa8daa79901b2bfdcf" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;;(ido-mode 1)

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
(require 'magit)

;;(setq-default shift-select-mode t)
(windmove-default-keybindings)
(setq windmove-wrap-around t)
(define-key input-decode-map "\e[1;2A" [S-up])

;; (setq redisplay-dont-pause t
;;   scroll-margin 1
;;   scroll-step 1
;;   scroll-conservatively 10000
;;   scroll-preserve-screen-position 1)

(setq redisplay-dont-pause t)
(setq scroll-step 1)



;;(setq-default global-font-lock-mode nil)
(global-font-lock-mode -1)
(setq-default indent-tabs-mode nil)

(global-set-key (kbd "C-x p") (lambda () (interactive) (other-window (- 1))))
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "C-x -") 'shrink-window)
(setq-default tab-width 4)


(menu-bar-mode -1)








