;-*- coding: utf-8 -*-

(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
;; (cua-mode t)

(global-set-key (kbd "M-`") 'other-frame)
(global-set-key (kbd "M-~") (lambda () (interactive) (other-frame (- 1))))
(windmove-default-keybindings 'meta)

;;(define-key minibuffer-local-map [C-tab] 'PC-lisp-complete-symbol)

(define-key text-mode-map [C-tab] 'ispell-complete-word)
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
;; (global-set-key (kbd "M-h") 'ns-do-hide-emacs)
;; (global-set-key (kbd "M-η") 'ns-do-hide-emacs)
;; (global-set-key (kbd "M-˙") 'ns-do-hide-others)
;; (global-set-key (kbd "M-ζ") 'ns-do-hide-others)
(global-set-key (kbd "C-ε") 'end-of-visual-line)
(global-set-key (kbd "C-α") 'beginning-of-visual-line)
(global-set-key (kbd "<home>") 'backward-word)
(global-set-key (kbd "<end>") 'forward-word)
(global-set-key (kbd "C-χ C-σ") 'save-buffer)
(global-set-key (kbd "C-χ C-ψ") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-υ") 'yank)
(global-set-key (kbd "C-ς") 'kill-region)
(global-set-key (kbd "M-ς") 'kill-ring-save)
(global-set-key (kbd "C-κ") 'kill-visual-line)
(global-set-key (kbd "M-κ") 'kill-sentence)
(global-set-key (kbd "C-χ θ") 'undo)
(global-set-key (kbd "C-῟") 'undo)
(global-set-key (kbd "C-χ C-<left>") 'previous-buffer)
(global-set-key (kbd "C-χ C-<right>") 'next-buffer)
(global-set-key (kbd "C-χ C-ε") 'eval-last-sexp)
(global-set-key (kbd "C-χ β") 'switch-to-buffer)
(global-set-key (kbd "C-γ") 'keyboard-quit)
(global-set-key (kbd "C-χ ο")'other-window)
(global-set-key (kbd "C-S-v") "✔")
(global-set-key (kbd "C-χ κ") 'kill-buffer)
(global-set-key (kbd "M-´") 'my-comment-line-or-region)
(add-hook 'LaTeX-mode-hook
		  (lambda ()
			(define-key LaTeX-mode-map [C-tab] 'TeX-complete-symbol)))
(global-set-key (kbd "C-χ δ") 'dired)
(global-set-key (kbd "C-ω")'scroll-up)
(global-set-key (kbd "M-ω")'scroll-down)
(global-set-key (kbd "M-α")'backward-sentence)
(global-set-key (kbd "M-ε")'forward-sentence)
(global-set-key (kbd "M-ι")'backward-paragraph)
(global-set-key (kbd "M-`")'forward-paragraph)
(global-set-key (kbd "C-σ")'isearch-forward)
(global-set-key (kbd "C-ρ")'isearch-backward)
(global-set-key (kbd "C-τ") 'transpose-chars)
(global-set-key (kbd "M-τ") 'transpose-words)
(global-set-key (kbd "C-χ C-τ") 'transpose-lines)
(global-set-key (kbd "M-ψ") 'capitalize-word)
(global-set-key (kbd "M-θ") 'upcase-word)
(global-set-key (kbd "M-λ") 'downcase-word)
(global-set-key (kbd "C-δ") 'delete-char)
(global-set-key (kbd "M-δ") 'kill-word)
(global-set-key (kbd "M-῎") 'dabbrev-expand)
(global-set-key (kbd "C-ξ") 'newline-and-indent)
(global-set-key (kbd "C-μ") 'newline-and-indent)
(global-set-key (kbd "C-ο") 'open-line)
(global-set-key (kbd "C-M-κ") 'kill-sexp)
(global-set-key (kbd "C-χ 5 2") 'make-frame-command)
(global-set-key (kbd "C-χ 5 0") 'delete-frame)
(global-set-key (kbd "C-χ 5 β") 'switch-to-buffer-other-frame)
(global-set-key (kbd "C-χ 5 φ") 'find-file-other-frame)
(global-set-key (kbd "C-χ 5 μ") 'compose-mail-other-frame)
(global-set-key (kbd "C-χ 5 .") 'find-tag-other-frame)
(global-set-key (kbd "C-χ 5 ρ") 'find-file-read-only-other-frame)
(global-set-key (kbd "C-χ σ") 'save-some-buffers)
(global-set-key (kbd "C-χ C-ρ") 'recentf-open-files)
(global-set-key (kbd "C-χ 1") 'delete-other-windows)
(global-set-key (kbd "C-χ 0") 'delete-window)
(global-set-key (kbd "C-χ 2") 'split-window-vertically)
(global-set-key (kbd "C-χ 3") 'split-window-horizontally)
(global-set-key (kbd "C-χ C-φ") 'find-file)
(global-set-key (kbd "M-<left>") 'beginning-of-visual-line)
(global-set-key (kbd "M-<right>") 'end-of-visual-line)

(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "M-z") 'undo)



















