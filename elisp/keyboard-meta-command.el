;-*- coding: utf-8 -*-

(define-key global-map [ns-drag-file] 'ns-find-file)
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
(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M-σ") 'save-buffer)
(global-set-key (kbd "C-χ C-ς") 'write-file)
(global-set-key (kbd "M-φ") 'forward-word)
(global-set-key (kbd "M-β") 'backward-word)
(global-set-key (kbd "M-δ") 'delete-word)
(global-set-key (kbd "C-ν") 'next-line)
(global-set-key (kbd "C-π") 'previous-line)
(global-set-key (kbd "C-ω") 'scroll-up)
(global-set-key (kbd "M-ω") 'scroll-down)
(global-set-key (kbd "C-β") 'backward-char)
(global-set-key (kbd "C-φ") 'forward-char)
(global-set-key (kbd "C-χ β") 'switch-to-buffer)
(global-set-key (kbd "C-χ C-β") 'list-buffer)
(global-set-key (kbd "C-χ C-f") 'find-file)
(global-set-key (kbd "M-ρ") 'move-to-window-line-top-bottom)
(global-set-key (kbd "M-γ γ") 'goto-line)
(global-set-key (kbd "M-γ M-γ") 'goto-line)
(global-set-key (kbd "M-χ") 'execute-extended-command)
(global-set-key (kbd "M-ς") 'kill-ring-save)
(global-set-key (kbd "C-υ") 'yank)
(global-set-key (kbd "C-ς") 'kill-region)
(global-set-key (kbd "C-θ") 'universal-argument)
(global-set-key (kbd "C-χ θ") 'undo)
(global-set-key (kbd "C-῟") 'undo)
(global-set-key (kbd "C-χ κ") 'kill-buffer)
(global-set-key (kbd "C-χ ο") 'other-window)
(global-set-key (kbd "C-χ C-ρ") 'recentf-open-files)
(global-set-key (kbd "C-χ C-ψ") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-γ") 'keyboard-quit)

(define-key minibuffer-local-map (kbd "C-γ") 'minibuffer-keyboard-quit)
;;(define-key debugger-mode-map (kbd ";") 'top-level)
;;(global-set-key (kbd "C-χ C-+") 'text-scale-adjust)
;;κ(global-set-key (kbd "C-χ C--") 'text-scale-adjust)





(global-set-key (kbd "M-<up>") 'scroll-down-line)
(global-set-key (kbd "M-<down>") 'scroll-up-line)
