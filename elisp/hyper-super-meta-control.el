;-*- coding: utf-8 -*-    

;; (cua-mode t)

(global-set-key (kbd "C-~") 'other-frame)
(global-set-key (kbd "C-`") (lambda () (interactive) (other-frame (- 1))))

(windmove-default-keybindings 'meta)

(global-set-key (kbd "s-SPC") 'set-mark-command)
(global-set-key (kbd "M-SPC") 'set-mark-command)


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

(global-set-key [s-tab] 'completion-at-point)
(define-key minibuffer-local-map [s-tab] 'lisp-complete-symbol)
(global-set-key [M-tab] 'completion-at-point)
(define-key minibuffer-local-map [M-tab] 'lisp-complete-symbol)
;;(define-key minibuffer-local-map [tab] 'completion-at-point)
;;(global-set-key (kbd "M-h") 'ns-do-hide-emacs)
;;(global-set-key (kbd "M-η") 'ns-do-hide-emacs)
;;(global-set-key (kbd "M-˙") 'ns-do-hide-others)
;;(global-set-key (kbd "M-ζ") 'ns-do-hide-others)
(global-set-key (kbd "C-χ C-σ") 'save-buffer)
(global-set-key (kbd "C-χ σ") 'save-some-buffers)
(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M-σ") 'save-buffer)
(global-set-key (kbd "C-χ C-ς") 'write-file)
(global-set-key (kbd "M-φ") 'forward-word)
(global-set-key (kbd "M-β") 'backward-word)
(global-set-key (kbd "M-δ") 'kill-word)
(global-set-key (kbd "C-δ") 'delete-char)
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
(global-set-key (kbd "C-χ ρ τ") 'string-rectangle)
(define-key minibuffer-local-map (kbd "C-γ") 'minibuffer-keyboard-quit)
;;(define-key debugger-mode-map (kbd ";") 'top-level)
;;(global-set-key (kbd "C-χ C-+") 'text-scale-adjust)
;;κ(global-set-key (kbd "C-χ C--") 'text-scale-adjust)

;;(global-set-key (kbd "M-<left>") 'backward-word)
;;(global-set-key (kbd "M-<right>") 'forward-word)
(global-set-key (kbd "C-<left>") 'beginning-of-visual-line)
(global-set-key (kbd "C-<right>") 'end-of-visual-line)

(global-set-key (kbd "M-α") 'backward-sentence)
(global-set-key (kbd "M-ε") 'forward-sentence)

(global-set-key (kbd "H-m") 'iconify-frame)
(global-set-key (kbd "H-μ") 'iconify-frame)

(global-set-key (kbd "s-i") 'imenu)
(global-set-key (kbd "s-ι") 'imenu)

(global-set-key (kbd "C-χ <left>") 'previous-buffer)
(global-set-key (kbd "C-χ <C-left>") 'previous-buffer)
(global-set-key (kbd "C-χ <right>") 'next-buffer)
(global-set-key (kbd "C-χ <C-right>") 'next-buffer)




;;(global-set-key (kbd "M-<up>") 'scroll-down-line) 
;;(global-set-key (kbd "M-<down>") 'scroll-up-line)

(global-set-key (kbd "H-h") (quote ns-do-hide-emacs))
(global-set-key (kbd "H-H") (quote ns-do-hide-others))

(global-set-key (kbd "s-h") 'backward-char)
(global-set-key (kbd "s-η") 'backward-char)
(global-set-key (kbd "s-l") 'forward-char)
(global-set-key (kbd "s-λ") 'forward-char)
(global-set-key (kbd "s-j") 'next-line)
(global-set-key (kbd "s-ξ") 'next-line)
(global-set-key (kbd "s-k") 'previous-line)
(global-set-key (kbd "s-κ") 'previous-line)
(global-set-key (kbd "s-b") 'backward-word)
(global-set-key (kbd "s-β") 'backward-word)
(global-set-key (kbd "s-f") 'forward-word)
(global-set-key (kbd "s-φ") 'forward-word)


(global-unset-key (kbd "s-H"))
(global-unset-key (kbd "s-Η"))
(global-unset-key (kbd "s-J"))
(global-unset-key (kbd "s-Ξ"))
(global-unset-key (kbd "s-K"))
(global-unset-key (kbd "s-Κ"))
(global-unset-key (kbd "s-L"))
(global-unset-key (kbd "s-Λ"))
(global-unset-key (kbd "s-F"))
(global-unset-key (kbd "s-Φ"))
(global-unset-key (kbd "s-B"))
(global-unset-key (kbd "s-Β"))
(global-unset-key (kbd "s-x"))




;;(global-set-key (kbd "H-h") 'backward-char
;;(global-set-key (kbd "H-η") 'backward-char
;;(global-set-key (kbd "H-l") 'forward-char)
;;(global-set-key (kbd "H-λ") 'forward-char)
;;(global-set-key (kbd "H-j") 'next-line)   
;;(global-set-key (kbd "H-ξ") 'next-line)   
;;(global-set-key (kbd "H-k") 'previous-line
;;(global-set-key (kbd "H-κ") 'previous-line
;;(global-set-key (kbd "H-b") 'backward-word
;;(global-set-key (kbd "H-β") 'backward-word
;;(global-set-key (kbd "H-f") 'forward-word)
;;(global-set-key (kbd "H-φ") 'forward-word)
;;
;;
;;(global-unset-key (kbd "H-H"))
;;(global-unset-key (kbd "H-Η"))
;;(global-unset-key (kbd "H-J"))
;;(global-unset-key (kbd "H-Ξ"))
;;(global-unset-key (kbd "H-K"))
;;(global-unset-key (kbd "H-Κ"))
;;(global-unset-key (kbd "H-L"))
;;(global-unset-key (kbd "H-Λ"))
;;(global-unset-key (kbd "H-F"))
;;(global-unset-key (kbd "H-Φ"))
;;(global-unset-key (kbd "H-B"))
;;(global-unset-key (kbd "H-Β"))

;;(global-set-key (kbd "H-h") 'ns-do-hide-emacs)
;;(global-set-key (kbd "M-H-h") 'ns-do-hide-others)
(global-unset-key (kbd "s-q"))


;;(global-set-key (kbd "H-h") 'backward-char)
;;(global-set-key (kbd "H-η") 'backward-char)
;;(global-set-key (kbd "H-l") 'forward-char)
;;(global-set-key (kbd "H-λ") 'forward-char)
;;(global-set-key (kbd "H-j") 'next-line)   
;;(global-set-key (kbd "H-ξ") 'next-line)   
;;(global-set-key (kbd "H-k") 'previous-line)
;;(global-set-key (kbd "H-κ") 'previous-line)
;;(global-set-key (kbd "H-b") 'backward-word)
;;(global-set-key (kbd "H-β") 'backward-word)
;;(global-set-key (kbd "H-f") 'forward-word)
;;(global-set-key (kbd "H-φ") 'forward-word)

(global-set-key (kbd "C-x f") 'select-frame-by-name)
(global-set-key (kbd "C-χ φ") 'select-frame-by-name)
;;(global-set-key (kbd "C-x C-f") '(lambda () (interactive) (frame-list)))
;;(global-set-key (kbd "C-χ C-φ") 'frame-list)

(defun modifier-to-string(mod)
  (cond ((eq mod 'meta) "Meta")
        ((eq mod 'control) "Control")
        ((eq mod 'hyper) "Hyper")
        ((eq mod 'super) "Super")
        ((eq mod 'none "none"))
        (t "nil")))
;;    (format "%4s" mod)))

;;(setq old-mac-option-modifier mac-option-modifier)
;;(setq old-mac-command-modifier mac-command-modifier)


; Initialize old-mac-modifier dictionary (to be used with the next defined functions) 
(setq old-mac-modifiers `((mac-option-modifier . ,(if mac-option-modifier mac-option-modifier 'meta))
                       (mac-command-modifier . ,(if mac-command-modifier mac-command-modifier 'control))))

(defun mod-name (modifier)
  (let* ((pref-beg (string-match "mac-" (symbol-name modifier)))
        (pref-end (match-end 0))
        (mod-end (string-match "-" (symbol-name modifier) pref-end)))
    (capitalize (substring (symbol-name modifier) pref-end mod-end))))

(defun toggle-modifier-key (modifier)
  (interactive)
  (if (and (not (eq (symbol-value modifier) nil))
           (not (eq (symbol-value modifier) 'none)))
        (progn
          (message "taking 'then' branch")
          ; save old value of modifier
          (setcdr (assq modifier old-mac-modifiers) (symbol-value modifier)) 
          (let ((mod-name (mod-name modifier)))
            (progn
              (set modifier nil)
              (force-mode-line-update 1)
              (message "%s key is not %s"
                       mod-name
                       (symbol-name (assoc-default modifier old-mac-modifiers 'eq))))))
          
    (progn
      (message "taking 'else' branch")
      (set modifier (assoc-default modifier old-mac-modifiers 'eq))
      (force-mode-line-update 1)
      (message "%s key is %s"
               (mod-name modifier)
               (symbol-name mac-option-modifier)))))

(defun toggle-mac-pass-command-to-system ()
  (interactive)
  (if mac-pass-command-to-system
      (progn
        (setq mac-pass-command-to-system nil)
        (force-mode-line-update 1)
        (message "Command key presses are not passed to system"))
    (progn
      (setq mac-pass-command-to-system t)
      (force-mode-line-update 1)
      (message "Command key presses are passed to system"))))

(defun toggle-mac-option-modifier ()
  (interactive)
  (toggle-modifier-key 'mac-option-modifier))
  



(define-prefix-command 'ctrl-semicolon-map)
(global-set-key (kbd "C-;") 'ctrl-semicolon-map)
(global-set-key (kbd "C-´") 'ctrl-semicolon-map)
(global-set-key [C-41] 'ctrl-semicolon-map)

(define-key ctrl-semicolon-map (kbd ";") 'toggle-mac-option-modifier)
(define-key ctrl-semicolon-map (kbd "C-;") 'toggle-mac-pass-command-to-system)
(define-key ctrl-semicolon-map (kbd "C-;") 'toggle-mac-pass-command-to-system)
(global-set-key (kbd "C-'") 'toggle-mac-option-modifier)
(global-set-key (kbd "C-᾽") 'toggle-mac-option-modifier)

(define-key ctrl-semicolon-map (kbd "´") '(lambda ()
                                            (interactive)
                                            (progn
                                              (toggle-mac-option-modifier)
                                              (insert ? )
                                              (delete-char (- 1)))))



(define-key ctrl-semicolon-map (kbd "C-´") 'toggle-mac-pass-command-to-system)


;;(global-set-key (kbd "M-;") 'toggle-mac-option-modifier)
;;(global-set-key (kbd "C-…") 'toggle-mac-option-modifier)
;;(global-set-key (kbd "M-C-´") 'toggle-mac-option-modifier)
;;
;;(global-set-key (kbd "C-;") 'toggle-mac-pass-command-to-system)
;;(global-set-key (kbd "C-´") 'toggle-mac-pass-command-to-system)
(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "s-σ") 'save-buffer)
(global-set-key (kbd "C-λ") 'recenter-top-bottom)

(global-set-key (kbd "H-<backspace>") 'delete-char)
(global-set-key (kbd "H-m") 'iconify-frame)
(global-set-key (kbd "H-μ") 'iconify-frame)



(global-set-key (kbd "C-S-<space>") 'set-mark-command)

(global-set-key (kbd "M-θ") 'upcase-word)
(global-set-key (kbd "M-λ") 'downcase-word)

(global-set-key (kbd "C-τ") 'transpose-chars)
(global-set-key (kbd "M-τ") 'transpose-words)

(global-set-key (kbd "M-ψ") 'capitalize-word)
(global-set-key (kbd "M-μ") 'newline-and-indent)

(global-set-key (kbd "M-p") 'fill-paragraph)
(global-set-key (kbd "M-π") 'fill-paragraph)