(require 'package) ;; package.el
;; repositories
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))

(package-initialize)

;; set PATH
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))

;; global custom key settings
(global-set-key (kbd "M-o") 'other-window)

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(require 'helm-config)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)

;; here's the setup for org-ref
;; some requires for basic org-ref usage
(require 'org-ref)
(require 'org-ref-pdf)
(require 'org-ref-url-utils)

;; Some org-mode customization
(setq org-src-fontify-natively t
      org-confirm-babel-evaluate nil
      org-src-preserve-indentation t
      org-link-abbrev-alist '(("att" . org-attach-expand-link))
      )

(org-babel-do-load-languages
 'org-babel-load-languages '((python . t)))

(setq org-latex-pdf-process
      '("pdflatex -interaction nonstopmode -output-directory %o %f"
	"bibtex %b"
	"pdflatex -interaction nonstopmode -output-directory %o %f"
	"pdflatex -interaction nonstopmode -output-directory %o %f"))

(setq bibtex-autokey-year-length 4
      bibtex-autokey-name-year-separator "-"
      bibtex-autokey-year-title-separator "-"
      bibtex-autokey-titleword-separator "-"
      bibtex-autokey-titlewords 2
      bibtex-autokey-titlewords-stretch 1
      bibtex-autokey-titleword-length 5)

(require 'dash)
(setq org-latex-default-packages-alist
      (-remove-item
       '("" "hyperref" nil)
       org-latex-default-packages-alist))

;; Append new packages
(add-to-list 'org-latex-default-packages-alist '("" "natbib" "") t)
(add-to-list 'org-latex-default-packages-alist
	     '("linktocpage,pdfstartview=FitH,colorlinks,
linkcolor=blue,anchorcolor=blue,
citecolor=blue,filecolor=blue,menucolor=blue,urlcolor=blue"
	       "hyperref" nil)
	     t)

(setq reftex-default-bibliography '("~/googleDrive/bibliography/references.bib"))

;; see org-ref for use of these variables
(setq org-ref-bibliography-notes "~/googleDrive/bibliography/notes.org"
      org-ref-default-bibliography '("~/googleDrive/bibliography/references.bib")
      org-ref-pdf-directory "~/googleDrive/Zotero")

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")


(setq ispell-program-name "/usr/local/bin/aspell")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("5f1bd7f67dc1598977e69c6a0aed3c926f49581fdf395a6246f9bc1df86cb030" default)))
 '(org-startup-truncated nil)
 '(package-selected-packages
   (quote
    (org-ref flyspell-correct org adaptive-wrap dracula-theme)))
 '(winner-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
