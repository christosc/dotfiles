;-*- coding: utf-8 -*-

(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
;; (cua-mode t)

(global-set-key (kbd "M-`") 'other-frame)
(global-set-key (kbd "M-~") (lambda () (interactive) (other-frame (- 1))))
(windmove-default-keybindings 'meta)



;;(define-key text-mode-map [C-tab] 'ispell-complete-word)
;; (add-hook fundamental-mode-hook
;; 		  (lambda ()
;; 			(define-key fundamental-mode-map [C-tab] 'ispell-complete-word)
;; 			)
		  
;; 		  )
;; (define-key fundamental-mode-map [C-tab] 'ispell-complete-word)


;; (global-set-key (kbd "C-χ") 'cua-cut-region)
;; (global-set-key [C-χ] 'kill-region)
(global-set-key (kbd "M-§") 'fill-paragraph)

(global-set-key [C-tab] 'completion-at-point)
(define-key minibuffer-local-map [C-tab] 'lisp-complete-symbol)
;;(define-key minibuffer-local-map [tab] 'completion-at-point)
(global-set-key (kbd "M-h") 'ns-do-hide-emacs)
(global-set-key (kbd "M-η") 'ns-do-hide-emacs)
(global-set-key (kbd "M-˙") 'ns-do-hide-others)
(global-set-key (kbd "M-ζ") 'ns-do-hide-others)
(global-set-key (kbd "C-χ C-σ") 'save-buffer)
(global-set-key (kbd "C-χ σ") 'save-some-buffers)
(global-set-key (kbd "C-χ C-ς") 'write-file)



(global-set-key (kbd "M-<up>") 'scroll-down-line)
(global-set-key (kbd "M-<down>") 'scroll-up-line)
