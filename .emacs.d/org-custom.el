;; (setq org-enforce-todo-dependencies t)
;(setq  org-agenda-dim-blocked-tasks t)
;; (setq org-enforce-todo-checkbox-dependencies t)
;; (setq org-deadline-warning-days 90)
(setq org-columns-default-format "%25ITEM %TODO  %3PRIORITY %20TAGS %10Effort{:} %CLOCKSUM")
(setq org-agenda-include-diary t)
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
(setq org-clock-idle-time 10)
(setq org-agenda-files '("~/Documents/orgfiles/"))
;; (setq org-upcoming-deadline '(:foreground "blue" :weight bold))


;; (setq-default org-mode-nday 28)  ;; τὸ ἀφ' ἑαυτοῦ διάστημα ἡμερῶν ποῦ θὰ δεικνύεται ἀπὸ τὴν agenda
(setq org-agenda-custom-commands
    '(("W" "Next 4 weeks agenda" agenda ""
	   ((org-agenda-start-on-weekday 0)
		(org-agenda-ndays 28)
		))
	  ))


(setq org-startup-indented t)
;(add-hook 'org-mode-hook (lambda () (variable-pitch-mode t)))
;(setq org-agenda-show-all-dates nil)


(defun day-diff (start-date end-date)
  "Ὑπολογίζει τὴν διαφορὰν δύο ἡμερομηνιῶν σὲ ἡμέρες."
  (let* ((time1 (apply 'encode-time (org-parse-time-string start-date)))
		 (time2 (apply 'encode-time (org-parse-time-string end-date)))
		 (t1 (org-float-time time1))
		 (t2 (org-float-time time2))
		 (diff (abs (- t2 t1)))
		 (ds (* 24 60 60))
		 (hs (* 60 60)))
	(/ diff ds))
  )

(defun hour-diff (start-date end-date)
  "Ὑπολογίζει τὴν διαφορὰν δύο ἡμερομηνιῶν σὲ ὧρες."
  (let* ((time1 (apply 'encode-time (org-parse-time-string start-date)))
		 (time2 (apply 'encode-time (org-parse-time-string end-date)))
		 (t1 (org-float-time time1))
		 (t2 (org-float-time time2))
		 (diff (abs (- t2 t1)))
		 (hs (* 60 60)))
	(/ diff hs)))


;; ΣΗΜΑΝΤΙΚΕΣ ΣΥΝΑΡΤΗΣΕΙΣ ΤΟΥ ORG-MODE ΠΟΥ ΕΧΩ ΦΤΕΙΑΞΕΙ ΕΓΩ ΑΥΤΟΣ
;; #+TBLFM: $3='(day-diff @4$1 $1);%.1f::$4='(/ (1+ (- (string-to-number $2) (string-to-number @-1$2))) (day-diff @-1$1 $1));%.2f::$5=(492-$2 +1)/$4;N%.1f::$6='(/ (1+ (- 492 (string-to-number $2)))(hour-diff $1 "<2010-05-01 Σάβ 00:00>"));%.2f::$7='(hour-diff $1 "<2010-05-01 Σαβ 00:00>");%.1f::@4$4=-

(setq org-todo-keywords
       '((sequence "ΠΟΙΗΤΕΟΝ" "ΑΝΑΒΕΒΛΗΜΕΝΟΝ(@/!)" "|" "ΤΕΤΕΛΕΣΜΕΝΟΝ(!)" "ΗΚΥΡΩΜΕΝΟΝ(@!)")))
;(setq org-fast-tag-selection-single-key t)
;; (setq org-deadline-string "ΔΙΟΡΙΑ:")
;; (setq org-scheduled-string "ΠΡΟΓΡΑΜΜΑΤΙΣΜΕΝΟΝ:")
;; (setq org-closed-string "ΕΚΛΕΙΣΘΗ:")
;; (setq org-clock-string "ΩΡΟΛΟΓΙΟΝ:")
;; (setq org-comment-string "ΣΧΟΛΙΟΝ")
;; (setq org-agenda-deadline-leaders '("Προθεσμία:  " "Ἐν %3d ἡμ.: "))

;; ΓΙΑ REMEMBER MODE
(org-remember-insinuate)
(setq org-directory "~/Documents/orgfiles")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cr" 'org-remember)