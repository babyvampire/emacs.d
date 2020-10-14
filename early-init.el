;; Starting with emacs 27.1, this early-init file is required to control the loading of emacs

;; and all this is currently from my spiritual emacs guide Protesilaos Stavrou, who notes:
;; "These adjustments are of paramount importance due to changes in the way Emacs initialises the package manager. Prior to Emacs 27.1, the init.el was supposed to handle that task by means of calling package-initialize. Whereas for Emacs 27.1, the default behaviour is to start the package manager before loading the user's init file. This can create unexpected results with regard to how existing configuration files are parsed—or at least that was my experience with certain settings not being parsed consistently (was not able to reproduce it reliably). I prefer the old behaviour so I simply tell the early-init.el to defer the process of initialising the package manager to when init.el is evaluated."

;; Do not initialise the package manager.  This is done in `init.el'.
(setq package-enable-at-startup nil)

;; Allow loading from the package cache.
(setq package-quickstart t)

;; Do not resize the frame at this early stage.
(setq frame-inhibit-implied-resize t)
