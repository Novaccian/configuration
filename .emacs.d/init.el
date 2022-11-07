(require 'package)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/contrib"))

(require 'org-checklist)
(require 'dired-x)

(setq org-directory
      (cond ((string= (system-name) "PE426MF") "D:/MEGA/doc")
	    (t "C:/")))
(setq org-agenda-files "~/.emacs.d/agenda-files")
(setq-default dired-omit-files-p t) ; Buffer-local variable
(setq ps-printer-name t)
(setq ps-lpr-command "C:/Program Files/gs/gs9.53.3/bin/gswin64c.exe")
(setq ps-lpr-switches '("-q" "-dNOPAUSE" "-dBATCH"
                        "-sDEVICE=mswinpr2"
                        "-sPAPERSIZE=a4"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(calendar-week-start-day 1)
 '(fill-column 80)
 '(initial-buffer-choice org-directory)
 '(initial-frame-alist '((height . 70) (width . 200) (top . 50) (left . 1)))
 '(org-agenda-custom-commands
   '(("g" "GTD"
      ((agenda ""
	       ((org-agenda-span 'week)
		(org-agenda-overriding-header "Scheduled")))
       (stuck ""
	      ((org-agenda-overriding-header "Stuck projects")))
       (todo "NEXT"
	     ((org-agenda-overriding-header "Not scheduled")
	      (org-agenda-skip-function
	       '(org-agenda-skip-entry-if 'scheduled 'deadline))))
       (todo "HOLD|WAIT"
	     ((org-agenda-overriding-header "Suspended")))
       (todo "PROJ"
	     ((org-agenda-overriding-header "Active projects"))))
      nil)))
 '(org-attach-store-link-p 'attached)
 '(org-capture-templates
   '(("e" "Event" entry
      (file+olp+datetree "events.org")
      "* %?
%T" :time-prompt t)
     ("t" "Task" entry
      (file+headline "gtd.org" "Captured")
      "* TODO REFILE TASK: %?
%U" :empty-lines 1)))
 '(org-capture-use-agenda-date t)
 '(org-clock-idle-time 60)
 '(org-clock-in-resume t)
 '(org-clock-out-remove-zero-time-clocks t)
 '(org-clock-persist 'clock)
 '(org-clock-report-include-clocking-task t)
 '(org-columns-default-format
   "%7TODO(State) %ITEM(Task) %2PRIORITY(P) %5Effort(Est.){:} %5CLOCKSUM(Time){:}")
 '(org-enforce-todo-dependencies t)
 '(org-habit-graph-column 60)
 '(org-hide-leading-stars t)
 '(org-log-done 'time)
 '(org-log-into-drawer t)
 '(org-log-reschedule 'note)
 '(org-modules
   '(org-bbdb org-bibtex org-docview org-habit org-info org-irc org-mhe org-rmail org-w3m org-learn org-toc))
 '(org-refile-allow-creating-parent-nodes 'confirm)
 '(org-refile-use-outline-path 'file)
 '(org-startup-folded t)
 '(org-stuck-projects '("/TODO|PROJ" ("NEXT" "WAIT") nil ""))
 '(org-todo-keywords
   '((sequence "PROJ(p)" "TODO(t)" "NEXT(n)" "HOLD(h@/!)" "WAIT(w@/!)" "|" "DONE(d)" "CANCELLED(c@/!)")))
 '(org-todo-repeat-to-state "NEXT")
 '(package-selected-packages '(magit yasnippet)))
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
(global-set-key (kbd "C-<f10>") 'next-buffer)
(global-set-key (kbd "M-<f9>") 'org-toggle-inline-images)
(global-set-key (kbd "C-x n r") 'narrow-to-region)
(global-set-key (kbd "C-c L") 'org-store-link)
(global-set-key (kbd "C-c C-x L") 'org-insert-link)

;; Resume clocking task when emacs is restarted
(org-clock-persistence-insinuate)

(setq org-global-properties
      '(("Effort_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("HOLD" :foreground "orange" :weight bold)
              ("WAIT" :foreground "orange" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold))))
