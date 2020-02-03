
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(require 'package)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(setq org-directory "C:/Users/flavi/Dropbox/Org")

(setq my-org-default-todo-file (format "%s/actions.org" org-directory))
(setq my-org-journal-file (format "%s/journal.org" org-directory))
(setq my-org-goals-file (format "%s/goals.org" org-directory))
(setq my-org-ref-file (format "%s/ref.org" org-directory)) ; should be machine-independent

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-buffer-choice org-directory)
 '(initial-frame-alist (quote ((height . 70) (width . 200) (top . 50) (left . 1))))
 '(org-agenda-custom-commands
   (quote
    ((" " "GTD"
      ((agenda ""
	       ((org-agenda-span
		 (quote day))
		(org-agenda-overriding-header "Scheduled")))
       (stuck ""
	      ((org-agenda-overriding-header "Stuck projects")))
       (todo "NEXT"
	     ((org-agenda-overriding-header "Not scheduled")
	      (org-agenda-skip-function
	       (quote
		(org-agenda-skip-entry-if
		 (quote scheduled)
		 (quote deadline))))))
       (todo "HOLD|WAITING"
	     ((org-agenda-overriding-header "Suspended"))))
      nil))))
 '(org-agenda-files "~/agenda_files")
 '(org-attach-store-link-p (quote attached))
 '(org-capture-templates
   (quote
    (("t" "todo" entry
      (file+headline my-org-default-todo-file "Tmp")
      "* TODO %? " :prepend t :empty-lines 1)
     ("a" "Appointment" entry
      (file+olp+datetree my-org-journal-file)
      "* APP %?
SCHEDULED: %T" :empty-lines 1)
     ("j" "Journal" entry
      (file+olp+datetree my-org-journal-file)
      "* %<%R> %?" :empty-lines 1)
     ("g" "Goals" entry
      (file my-org-goals-file)
      "* GOAL %?
  - Started on %U
  :SMART:
  :Specific:   
  :Measurable: 
  :Actionable: 
  :Timebound:  
  :END:
  :ACTIONS:

  :END:
" :empty-lines 1)
     ("r" "Reference" entry
      (file "~/org/notes.org")
      "")
     ("m" "Weekly Meal Plan" entry
      (file+olp+datetree my-org-journal-file)
      "* W%<%V> Meal Plan
  |-----+-----------+-------+-------+--------|
  | Day | Breakfast | Lunch | Snack | Dinner |
  |-----+-----------+-------+-------+--------|
  | Mon |           |       |       |        |
  |-----+-----------+-------+-------+--------|
  | Tue |           |       |       |        |
  |-----+-----------+-------+-------+--------|
  | Wed |           |       |       |        |
  |-----+-----------+-------+-------+--------|
  | Thu |           |       |       |        |
  |-----+-----------+-------+-------+--------|
  | Fri |           |       |       |        |
  |-----+-----------+-------+-------+--------|
  | Sat |           |       |       |        |
  |-----+-----------+-------+-------+--------|
  | Sun |           |       |       |        |
  |-----+-----------+-------+-------+--------|
" :empty-lines 1)
     ("c" "Checklists")
     ("cf" "Financial Weekly Review" entry
      (file+olp+datetree my-org-journal-file)
      "* W%<%V> Financial Review
  - [0/7] Reconcile my accounts
    - [ ] Portofel
    - [ ] Revolut
    - [ ] Cont curent BRD
    - [ ] Cont curent CEC
    - [ ] Card Sodexo
    - [ ] Card Unicredit Meniu
    - [ ] Vitrina

  - [0/4] Reconcile Adi's accounts
    - [ ] Portofel Adi
    - [ ] Card Sodexo Adi
    - [ ] Cont curent Raiffeisen
    - [ ] Revolut Adi

  - [ ] Move coins to/from storage
")
     ("cF" "Financial Monthly Review" entry
      (file+olp+datetree my-org-journal-file)
      "* %<%B %Y> Financial Review
  - Venituri

  - Cheltuieli

  - Profit/Pierdere
" :empty-lines 1)
     ("cg" "GTD Weekly Review" entry
      (file+olp+datetree my-org-journal-file)
      "* W%<%V> GTD Review
  - [0/4] Get clear
    - [ ] Collect loose papers and materials into in-tray
    - [ ] Process in-tray, emails
    - [ ] Browse through the journal notes for the past week
    - [ ] Empty your head and capture ideas (5min)
  - [0/3] Get current
    - [ ] Review upcoming events and deadlines
    - [ ] Review NEXT/HOLD/WAITING actions: set priorities,
      schedule/cancel/hold
    - [ ] Review projects and goals: evaluate progress and take
      corrective actions" :empty-lines 1)
     ("w" "Work"))))
 '(org-clock-idle-time 60)
 '(org-clock-in-resume t)
 '(org-clock-out-remove-zero-time-clocks t)
 '(org-clock-persist (quote clock))
 '(org-clock-report-include-clocking-task t)
 '(org-columns-default-format
   "%7TODO(State) %ITEM(Task) %2PRIORITY(P) %5Effort(Est.){:} %5CLOCKSUM(Time){:}")
 '(org-enforce-todo-dependencies t)
 '(org-log-done (quote time))
 '(org-log-into-drawer t)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-habit org-info org-irc org-mhe org-rmail org-w3m org-learn org-toc)))
 '(org-refile-allow-creating-parent-nodes (quote confirm))
 '(org-refile-use-outline-path (quote file))
 '(org-stuck-projects (quote ("/TODO|PROJ" ("NEXT") nil "")))
 '(org-todo-repeat-to-state "NEXT")
 '(package-selected-packages (quote (yasnippet))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 

(global-set-key (kbd "<f11>") 'org-clock-goto)
(global-set-key (kbd "<f12>") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-<f9>") 'previous-buffer)
(global-set-key (kbd "M-<f9>") 'org-toggle-inline-images)
(global-set-key (kbd "C-x n r") 'narrow-to-region)
(global-set-key (kbd "C-<f10>") 'next-buffer)
(global-set-key (kbd "C-c L") 'org-store-link)
(global-set-key (kbd "C-c C-x L") 'org-insert-link)

;; Resume clocking task when emacs is restarted
(org-clock-persistence-insinuate)

(setq org-columns-default-format "%50ITEM(Task) %2PRIORITY %10Effort(Effort){:} %10CLOCKSUM")

(setq org-global-properties
      '(("Effort_ALL" .
         "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")))

(setq org-todo-keywords
      (quote ((sequence "PROJ(p)" "TODO(t)" "NEXT(n)" "HOLD(h@/!)" "WAITING(w@/!)" "|" "DONE(d@/!)" "CANCELLED(c@/!)" "APP(a)"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("HOLD" :foreground "orange" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold))))
