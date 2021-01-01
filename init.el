;; turns on debugging at the beginning, so if something breaks during init,
;; we get dumped into a debugger
(setq debug-on-error t)

;; Make all commands of the “package” module present.
(require 'package)

;; Internet repositories for new packages.
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

;; Make sure `use-package' is available.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Configure `use-package' prior to loading it.
(eval-and-compile
  (setq use-package-always-ensure nil)
  (setq use-package-always-defer nil)
  (setq use-package-always-demand nil)
  (setq use-package-expand-minimally nil)
  (setq use-package-enable-imenu-support t)
  (setq use-package-compute-statistics t)
;;   ;; The following is VERY IMPORTANT.  Write hooks using their real name
;;   ;; instead of a shorter version: after-init ==> `after-init-hook'.
;;   ;;
;;   ;; This is to empower help commands with their contextual awareness,
;;   ;; such as `describe-symbol'.
  (setq use-package-hook-name-suffix nil))

(eval-when-compile
  (require 'use-package))
(require 'bind-key)
(setq use-package-always-ensure t)


;; I installed use-package from its github
;; to update fom .../site-lisp/use-package, git pull + make
;; (add-to-list 'load-path "~/.emacs.d/site-lisp/use-package")
;; (require 'use-package)

;; (with-eval-after-load 'info
;;   (info-initialize)
;;   (add-to-list 'Info-directory-list
;; 	       "~/.emacs.d/site-lisp/use-package/"))


;; (eval-when-compile
;;   (require 'use-package))
;; (require 'diminish)
;; (require 'bind-key)

(let* ((conf "~/.emacs.d/config")
       (el (concat conf ".el"))
       (org (concat conf ".org")))
  (if (file-exists-p el)
      (load-file el)
    (use-package org)
    (org-babel-load-file org)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(yaml-mode which-key use-package sdcv pyenv-mode-auto py-autopep8 projectile paradox ox-rst ox-reveal orglue orgit org-superstar org-ref org-preview-html org-journal org-eww org-download org-bullets olivetti modus-vivendi-theme modus-operandi-theme lsp-ui lsp-ivy helm-org helm-lsp helm-descbinds helm-bind-key forge flyspell-correct flycheck-vdm expand-region exec-path-from-shell elpygen elpy docker dimmer diminish dap-mode company-jedi company-go bug-hunter adaptive-wrap)))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
