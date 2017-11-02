;;; Melpa --- None
;;(require 'package)
;;(add-to-list 'package-archives
;;             '("melpa" . "https://melpa.org/packages/") t)
;;(when (< emacs-major-version 24)
;;  ;; For important compatibility libraries like cl-lib
;;  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))



(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("38e64ea9b3a5e512ae9547063ee491c20bd717fe59d9c12219a0b1050b439cdd" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "5ee12d8250b0952deefc88814cf0672327d7ee70b16344372db9460e9a0e3ffc" "cedc5fdf7b619be44d0bd5d0943822930645ed561aa2548f1578dc0992e99569" "1157a4055504672be1df1232bed784ba575c60ab44d8e6c7b3800ae76b42f8bd" default)))
 '(display-time-mode t)
 '(package-selected-packages
   (quote
    (react-snippets lorem-ipsum rjsx-mode markdown-mode+ markdown-preview-eww flycheck flycheck-pyflakes markdown-preview-mode markdown-mode pacmacs cyberpunk-theme moe-theme focus ## origami ensime ein undo-tree multiple-cursors jsx-mode skewer-mode simple-httpd bongo pyenv-mode-auto pyenv-mode)))
 '(shell-pop-default-directory "/User/Sol")
 '(shell-pop-full-span t)
 '(shell-pop-term-shell "/bin/zsh")
 '(shell-pop-universal-key "C-t")
 '(shell-pop-window-position "bottom"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;theme set up
(load-theme 'material t)

;; default font setting
(set-default-font "Monoid 9")

;;multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)



;;ORG-MODE key settings
(add-to-list 'load-path "~/.emacs.d/org/org-mode/lisp/")
(add-to-list 'load-path "~/.emacs.d/org/org-mode/contrib/lisp/")
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)


;; indent 4 spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)



;;ORG-TODO
(setq org-todo-keywords
      '((sequence "TODO" "DOING" "TIME OFF" "REPETITION" "|" "DONE")
	(type "Python" "Djangp")))
;;Setting up capture
(setq org-default-notes-file (concat "~/.emacs.d/org/org-mode/lisp/" "notes.org"))
(define-key global-map "\C-cc" 'org-capture)


;;ac-html
(defun setup-ac-for-haml ()
  ;; Require ac-haml since we are setup haml auto completion
  (require 'ac-haml)
  ;; Require default data provider if you want to use
  (require 'ac-html-default-data-provider)
  ;; Enable data providers,
  ;; currently only default data provider available
  (ac-html-enable-data-provider 'ac-html-default-data-provider)
  ;; Let ac-haml do some setup
  (ac-haml-setup)
  ;; Set your ac-source
  (setq ac-sources '(ac-source-haml-tag
                     ac-source-haml-attr
                     ac-source-haml-attrv))
  ;; Enable auto complete mode
  (auto-complete-mode))

(add-hook 'haml-mode-hook 'setup-ac-for-haml)

;;shell-pop
(add-to-list 'load-path "~/.emacs.d/elpa/shell-pop-20161127.623/")
(require 'shell-pop)


;; Setup react-snippets
(require 'react-snippets)


;; virtualenvwrapper
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
(setq venv-location "/usr/local/var/pyenv/versions/")

;;pyenv-mode-auto
(require 'pyenv-mode-auto)

;;ace-window key set
(global-set-key (kbd "C-x o") 'ace-window)

;;Jedi : python auto-complete
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;;js -> jsx-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
;;for JSX
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . rjsx-mode))



;; add libs to our path
(add-to-list 'load-path (expand-file-name "~/.emacs.d/column-marker"))
(require 'column-marker)
;; add a highlighter to column 80 for python files
(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-3 80)))

;; NeoTree
(add-to-list 'load-path "~/.emacs.d/neotree/emacs-neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(neotree-toggle)

;;python syntax checker
(add-hook 'after-init-hook #'global-flycheck-mode)


(global-linum-mode t)
;; line-num mode setting
(defun sol-linum-mode ()
  (linum-mode)
  (setq linum-format "%d -")
  (set-face-foreground 'linum "white")
  )
;; python
(add-hook 'python-mode-hook 'sol-linum-mode)
;; elisp
(add-hook 'emacs-lisp-mode-hook 'sol-linum-mode)
;; sql
(add-hook 'sql 'sol-linum-mode)

;;anaconda-mode
(add-hook 'python-mode-hook 'anaconda-mode)

;; time display
(display-time)

;; yes or no -> y or n
(fset 'yes-or-no-p 'y-or-n-p)


;;Bongo(Music Player)
(setq-default bongo-enabled-backends '(mplayer))

;;Tramp mode
(setq tramp-default-method "ssh")


;;origami mode
(global-set-key (kbd "C-{") 'origami-close-node);
(global-set-key (kbd "C-}") 'origami-open-node);


(global-origami-mode 1);
