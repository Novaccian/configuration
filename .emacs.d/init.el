;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(require 'package)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'load-path (expand-file-name "~/.emacs.d/contrib"))
(require 'org-checklist)

(setq org-directory
      (cond ((string= (system-name) "PE426MF") "C:/Users/flavi/Dropbox/GTD")
	    ; maybe Fresenius OneDrive is better?
	    ((string= (system-name) "7BKQKQ2") "C:/Users/nicolae.novac/Dropbox/GTD/GTD Work")
	    ((string= (system-name) "HP861G2") "C:/Users/nicolae.novac/Dropbox/GTD/GTD Work")
	    (t "C:/")))
(setq org-agenda-files
      (concat org-directory "/agenda-files"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fill-column 80)
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
 '(org-attach-store-link-p (quote attached))
 '(org-capture-templates
   (quote
    (("j" "Journal" entry
      (file+olp+datetree "journal.org")
      "** %<%H:%M> %?\n")
     )))
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
