;;; package --- to rule them all

(setq auto-save-interval 5 auto-save-timeout 1)
(setq evil-want-integration nil)
;;(scroll-bar-mode -1)

(set-face-attribute 'default nil
                    :family "Knack NF"
                    :height 150
                    :weight 'normal
                    :width 'normal)

(require 'package)
;;; Code:
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


;; install use-package https://github.com/jwiegley/use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;; and always use :ensure t
(setq use-package-always-ensure t)

;; fix for iTerm alt-right and alt-left keys
(define-key input-decode-map "\ef" [M-right])
(define-key input-decode-map "\eb" [M-left])


(eval-when-compile
  (require 'use-package))

(use-package color-theme-approximate
  :config  (color-theme-approximate-on))

(use-package evil-leader
  :ensure t
  :init (global-evil-leader-mode)
  :config (evil-leader/set-leader "SPC"))

(evil-leader/set-key
  "b" 'helm-buffers-list
  ;; "b" 'helm-projectile-switch-to-buffer
  "h" 'helm-mini
  "d" 'dash-at-point
  "l" 'linum-mode
  "t" 'neotree-toggle
  "w" 'save-buffer
  "§" 'eshell
  "op" (lambda () (interactive) (find-file "~/org/personal.org"))
  "ow" (lambda () (interactive) (find-file "~/org/work.org"))
  "x" 'eval-buffer
  "c" 'comment-dwim-line
  "e" 'helm-find-files
  "f" 'helm-mini
  "r" 'quickrun
  "R" 'quickrun-with-arg
  "/" 'evil-search-highlight-persist-remove-all
  "p" 'helm-projectile
  "sp" 'helm-projectile-switch-project
  "kp" 'projectile-kill-buffers
  ">" 'evil-next-buffer
  "<" 'evil-prev-buffer
  ;; (kbd "SPC") 'keyboard-escape-quit
  "z" 'hs-toggle-hiding)

;; (evil-leader/set-key-for-mode 'org-mode
;;   "oh" 'org-insert-heading
;;   "ol" 'org-babel-load-file
;;   "os" 'org-sort-list
;;   "ot" 'org-todo
;;   "oT" 'jcf-evil-org-insert-todo
;;   "obt" 'org-babel-tangle)


(global-set-key (kbd "<escape>")      'keyboard-escape-quit)

(use-package evil
    :ensure t
    :init
    (setq evil-want-C-w-delete t
          evil-want-fine-undo "No"
          evil-want-Y-yank-to-eol t
          evil-want-C-u-scroll t
          evil-ex-substitute-global t
          evil-overriding-maps nil
          evil-search-module 'evil-search)

    ;; Persistent undo history (save info to file)
    (setq undo-tree-auto-save-history t
          undo-tree-history-directory-alist `((".*" . "~/.emacs.d/tmp")))
    :config
    (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))


(defun simulate-key-press (key)
  "Pretend that KEY was pressed. KEY must be given in `kbd' notation."
  `(lambda ()
     (interactive)
     (setq prefix-arg current-prefix-arg)
     (setq unread-command-events (listify-key-sequence (read-kbd-macro ,key)))))

(define-key evil-normal-state-map (kbd "SPC v") (simulate-key-press "vip"))

;; adding aditional evil commands
(evil-ex-define-cmd "k[ill-buffer]" 'kill-this-buffer)

(setq evil-want-fine-undo 'no)

(setq evil-normal-state-cursor   '("dodger blue" box)
      evil-insert-state-cursor   '("dodger blue" bar)
      evil-replace-state-cursor  '("dodger blue" hbar)
      evil-operator-state-cursor '("dodger blue" (hbar . 7))
      evil-visual-state-cursor   '("orange" box)
      evil-motion-state-cursor   '("deep pink" box)
      evil-emacs-state-cursor    '("red2" box))

(defun my-save-if-bufferfilename ()
  (if (and (buffer-file-name) (buffer-modified-p) (string= evil-state "normal"))
      (progn
        (save-buffer)
        )
    ;;(message "no file is associated to this buffer: do nothing")
    )
)
(add-hook 'auto-save-hook 'my-save-if-bufferfilename)

;;Exit insert mode by pressing j and then j quickly
; (setq key-chord-two-keys-delay 0.5)
;(define-key evil-insert-state-map "jj" 'evil-normal-state)
; (key-chord-mode 1)

(define-key evil-normal-state-map (kbd "C-k") (lambda ()
                    (interactive)
                    (evil-scroll-up nil)))
(define-key evil-normal-state-map (kbd "C-j") (lambda ()
                        (interactive)
                        (evil-scroll-down nil)))

(use-package evil-search-highlight-persist
  :config
  (global-evil-search-highlight-persist t))

(use-package key-chord
  :ensure t
  :config
  (key-chord-mode 1)
  (setq key-chord-two-keys-delay 0.5)
  (key-chord-define evil-insert-state-map  "jj" 'evil-normal-state)
  (key-chord-define evil-insert-state-map  "jk" 'evil-normal-state))

(defun comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
        If no region is selected and current line is not blank and we are not at the end of the line,
        then comment current line.
        Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))

(define-key evil-normal-state-map (kbd "TAB") 'helm-projectile-switch-to-buffer)

(define-key evil-normal-state-map "j" 'evil-next-visual-line)
(define-key evil-normal-state-map "k" 'evil-previous-visual-line)
(define-key evil-normal-state-map "gc" 'comment-dwim-line)

;(define-key evil-ex-map "b" 'helm-buffers-list)
;(define-key evil-ex-map "e" 'find-file)

(defvar my-leader-map (make-sparse-keymap)
  "Keymap for \"leader key\" shortcuts.")

(define-key evil-normal-state-map (kbd "C-a") 'move-beginning-of-line)
(define-key evil-normal-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)
(define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)

(evil-define-key 'normal org-mode-map
  (kbd "TAB") 'org-cycle
  ">" 'org-shiftmetaright
  "<" 'org-shiftmetaleft)

(setq evil-move-cursor-back nil)

(use-package evil-matchit
  :ensure t
  :config
  (global-evil-matchit-mode 1))

(use-package evil-surround
  :config
  (global-evil-surround-mode 1))

(use-package evil-visualstar)

(setq-default evil-symbol-word-search t)

(setq evil-default-cursor t)

;; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)


(evil-set-initial-state 'calendar-mode 'emacs)
;(evil-set-initial-state 'org-mode 'emacs)

(global-set-key (kbd "C-x k") 'kill-this-buffer)

(menu-bar-mode -1)
(global-hl-line-mode 1)
(global-prettify-symbols-mode) ;; coverts some words to symbols

;; smooth scrolling
(use-package smooth-scrolling)
(setq scroll-margin 0)
(setq scroll-conservatively 10000)
(setq scroll-preserve-screen-position t)

;; When saving a file that starts with #!, make it executable.
(add-hook 'after-save-hook
          #'executable-make-buffer-file-executable-if-script-p)

;;(load-library "hideshow")
;; (add-hook 'emacs-lisp-mode-hook
;;           (lambda () (hs-minor-mode 1)
;;             (hs-hide-all)
;;             (set (make-variable-buffer-local 'my-hs-hide) t)))

(defun toggle-selective-display (column)
      (interactive "P")
      (set-selective-display
       (or column
           (unless selective-display
             (1+ (current-column))))))

(defun toggle-hiding (column)
  (interactive "P")
  (if hs-minor-mode
      (if (condition-case nil
              (hs-toggle-hiding)
            (error t))
          (hs-show-all))
    (toggle-selective-display column)))

(defun display-code-line-counts (ov)
  (when (eq 'code (overlay-get ov 'hs))
    (overlay-put ov 'help-echo
                 (buffer-substring (overlay-start ov)
                                   (overlay-end ov)))))
(setq hs-set-up-overlay 'display-code-line-counts)

(add-hook 'python-mode-hook 'hs-minor-mode)

(defvar my-hs-hide t "Current state of hideshow for toggling all.")
;;;###autoload
(defun my-toggle-hideshow-all ()
  "Toggle hideshow all."
  (interactive)
  (set (make-variable-buffer-local 'my-hs-hide) (not my-hs-hide))
  (if my-hs-hide
      (hs-hide-all)
    (hs-show-all)))
(global-set-key (kbd "C-c @ @") 'my-toggle-hideshow-all)
(global-set-key (kbd "C-c @ h") 'hs-hide-block)
(global-set-key (kbd "C-c @ s") 'hs-show-block)
(global-set-key (kbd "C-c @ SPC") 'hs-show-block)

(recentf-mode 1)
(setq recentf-max-saved-items 200)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)


(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'tomorrow-night-eighties t)

;; (use-package color-theme-sanityinc-tomorrow
;;   :config
;;   (color-theme-sanityinc-tomorrow-eighties))

;; Do not create backup files
(setq make-backup-files nil)

;; Auto-Save in /tmp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;Always follow symlinks
(setq vc-follow-symlinks t)

;; Confirm before closing Emacs
;;(setq confirm-kill-emacs 'y-or-n-p)

;; Ask y/n instead of yes/n
(fset 'yes-or-no-p 'y-or-n-p)

;; Auto revert files on change
(global-auto-revert-mode t)

;; Disable startup message
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Display the current time
;(display-time-mode t)

;; Remember the cursor position of files when reopening them
(require 'saveplace)
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(save-place-mode 1)

;; Tabs and spaces
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq python-indent 4)
(setq ruby-indent-size 2)

;; Auto-indent with the Return key
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Show matching paren
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#3b3b3b" "#f2777a" "#99cc99" "#ffcc66" "#99cccc" "#cc99cc" "#99cccc" "#cccccc"])
 '(ansi-term-color-vector
   [unspecified "#3b3b3b" "#f2777a" "#99cc99" "#ffcc66" "#99cccc" "#cc99cc" "#99cccc" "#cccccc"] t)
 '(custom-enabled-themes (quote (tomorrow-night-eighties)))
 '(custom-safe-themes
   (quote
    ("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" default)))
 '(fci-rule-color "#d6d6d6")
 '(line-number-mode nil)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-rmail org-w3m org-bullets)))
 '(org-trello-current-prefix-keybinding "C-c o" nil (org-trello))
 '(org-trello-files (quote ("~/org/personal.org")) nil (org-trello))
 '(package-selected-packages
   (quote
    (evil-collection web-mode dockerfile-mode helm-swoop guide-key org-trello helm-projectile magit fuzzy-format flymake-go smooth-scrolling neotree all-the-icons-dired git-gutter-fringe helm-ag super-save gorepl-mode sublimity-map sublimity-scroll sublimity fiplr mode-icons evil-surround eruby-mode quickrun go-autocomplete go-eldoc go-eldoc-setup powershell fzf go-mode-autoloads go-mode color-theme-sanityinc-tomorrow smartparens org-journal sr-speedbar forecast multiple-cursors company yasnippet expand-region org-jira yaml-mode projectile helm xclip evil-matchit exec-path-from-shell rainbow-delimiters flycheck spaceline centered-cursor-mode auto-complete dash-at-point org-bullets evil-visualstar markdown-mode evil)))
 '(show-paren-delay 0.0)
 '(spaceline-all-the-icons-clock-always-visible nil)
 '(spaceline-all-the-icons-primary-separator "|")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#c82829")
     (40 . "#f5871f")
     (60 . "#eab700")
     (80 . "#718c00")
     (100 . "#3e999f")
     (120 . "#4271ae")
     (140 . "#8959a8")
     (160 . "#c82829")
     (180 . "#f5871f")
     (200 . "#eab700")
     (220 . "#718c00")
     (240 . "#3e999f")
     (260 . "#4271ae")
     (280 . "#8959a8")
     (300 . "#c82829")
     (320 . "#f5871f")
     (340 . "#eab700")
     (360 . "#718c00"))))
 '(vc-annotate-very-old-color nil))
(show-paren-mode t)

;; Delete trailing whitespace
(add-hook 'before-save-hook '(lambda()
                              (when (not (derived-mode-p 'markdown-mode))
                                (delete-trailing-whitespace))))

; (ido-mode 1)
; (setq ido-enable-flex-matching t)
; (setq ido-everywhere t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:foreground "GoldenRod1" :weight bold :height 2))))
 '(org-level-2 ((t (:foreground "LightYellow1" :height 1.5))))
 '(org-level-3 ((t (:foreground "LightYellow1"))))
 '(org-level-4 ((t (:foreground "LightYellow1"))))
 '(org-level-5 ((t (:foreground "LightYellow1"))))
 '(org-level-6 ((t (:foreground "#d0d0ca"))))
 '(org-level-7 ((t (:foreground "#d0d0ca"))))
 '(org-level-8 ((t (:foreground "#d0d0ca"))))
 '(org-link ((t (:foreground "#5050FF" :underline t))))
 '(org-tag ((t (:foreground "purple"))))
 '(powerline-evil-normal-face ((t (:inherit powerline-evil-base-face :background "chartreuse3"))))
 '(sml/folder ((t (:inherit sml/global :background "grey22" :foreground "grey50" :weight normal))))
 '(sml/git ((t (:background "grey22" :foreground "chartreuse3"))))
 '(spaceline-all-the-icons-info-face ((t (:foreground "#63B2FF")))))







;; markdown settings
(use-package markdown-mode
  :ensure t
  :mode "\\.md\\'"
  :config
  (setq markdown-command "pandoc --from markdown_github-hard_line_breaks --to html")
  (define-key markdown-mode-map (kbd "C-\\")  'markdown-insert-list-item)
  (define-key markdown-mode-map (kbd "C-c '") 'fence-edit-code-at-point)
  (define-key markdown-mode-map (kbd "C-c 1") 'markdown-insert-header-atx-1)
  (define-key markdown-mode-map (kbd "C-c 2") 'markdown-insert-header-atx-2)
  (define-key markdown-mode-map (kbd "C-c 3") 'markdown-insert-header-atx-3)
  (define-key markdown-mode-map (kbd "C-c 4") 'markdown-insert-header-atx-4)
  (define-key markdown-mode-map (kbd "C-c 5") 'markdown-insert-header-atx-5)
  (define-key markdown-mode-map (kbd "C-c 6") 'markdown-insert-header-atx-6)

  (add-hook 'markdown-mode-hook (lambda ()
                                  (yas-minor-mode t)
                                  (set-fill-column 80)
                                  (turn-on-auto-fill)
                                  (flyspell-mode))))





;; org-mode settings
(setq org-startup-indented t)
(setq org-M-RET-may-split-line nil)
(setq org-blank-before-new-entry '( (plain-list-item . nil)))
(setq org-completion-use-ido t)
(setq org-list-description-max-indent 5)

(global-set-key (kbd "C-c w")
                (lambda () (interactive) (find-file "~/org/work.org")))
(global-set-key (kbd "C-c p")
                (lambda () (interactive) (find-file "~/org/personal.org")))

(setq org-todo-keywords
      '((sequence "TODO" "DOING" "WAITING" "|" "DONE" "CANCELED")))

(add-hook 'org-mode-hook
          (lambda ()
            (define-key evil-normal-state-map (kbd "TAB") 'org-cycle)
            (define-key evil-normal-state-map (kbd "M-RET") 'org-insert-heading-respect-content)
            (define-key evil-normal-state-map (kbd "M-b") 'org-do-promote)
            (define-key evil-normal-state-map (kbd "M-f") 'org-do-demote)))


(setq org-agenda-files '("~/org"))
(setq org-refile-targets '((org-agenda-files . (:maxlevel . 6))))
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-default-notes-file "~/org/notes.org")

(setq org-hide-emphasis-markers t)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

(setq org-log-done t)
(setq org-fast-tag-selection-single-key t)
(setq org-use-fast-todo-selection t)
(setq org-startup-truncated nil)

(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "red" :weight itallic))
        ("DOING" . (:foreground "LightGoldenrod1" :weight bold))
        ("DONE" . (:foreground "green" :weight bold))
        ("CANCELED" . (:foreground "darkgray" :weight bold))
        ("WAITING" . (:foreground "gray" :weight bold))))

(custom-theme-set-faces 'user
   `(org-level-1 ((t (:foreground "#d689d5" :weight normal))))
   `(org-level-2 ((t (:foreground "#62b0d5" :weight normal))))
   `(org-level-3 ((t (:foreground "#d0d0ca"))))
   `(org-level-4 ((t (:foreground "#d0d0ca"))))
   `(org-level-5 ((t (:foreground "#d0d0ca"))))
   `(org-level-6 ((t (:foreground "#d0d0ca"))))
   `(org-level-7 ((t (:foreground "#d0d0ca"))))
   `(org-level-8 ((t (:foreground "#d0d0ca"))))
   '(org-tag ((t (:foreground "red"))))
   '(org-link ((t (:foreground "#5050FF" :underline t)))) )

(use-package org-bullets
  :init
  (setq org-bullets-bullet-list
        '("✸" "○" "•" "•" "•" "•" "•" "•" "•" "•" "•" "•" "•" ))
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(add-hook 'org-insert-heading-hook 'evil-insert-state)

(use-package org-journal
  :init
  (setq org-journal-dir "~/org/journal/")
  (setq org-journal-date-format "#+TITLE: Journal Entry- %e %b %Y (%A)")
  (setq org-journal-time-format ""))

(setq org-capture-templates
      '(("n" "Thought or Note"  entry
         (file org-default-notes-file)
         "* %?\n\n  %i\n\n  See: %a" :empty-lines 1)
        ("j" "Journal Note"     entry
         (file (get-journal-file-today))
         "* %?\n\n  %i\n\n  From: %a" :empty-lines 1)
        ))

(setq org-ellipsis " ↴ ")
;; (setq org-ellipsis " ⚡")

(eval-after-load "org"
  '(require 'ox-md nil t))

(use-package evil-visualstar
  :ensure t
  :config
  (global-evil-visualstar-mode))

(use-package dash-at-point
  :ensure t
  :config
  (global-set-key "\C-cd" 'dash-at-point)
  (global-set-key "\C-ce" 'dash-at-point-with-docset))

(use-package auto-complete
  :ensure t
  :config
  (ac-config-default)
  )

(use-package centered-cursor-mode
  :ensure t
  :config
  (global-centered-cursor-mode +1))

(use-package whitespace)
(setq whitespace-display-mappings
   ;; all numbers are Unicode codepoint in decimal. try (insert-char 182 ) to see it
  '(
    (space-mark 32 [183] [46]) ; 32 SPACE, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
    (newline-mark 10 [182 10]) ; 10 LINE FEED
    (tab-mark  9 [183 183 183 183] [92 9])
  ; (tab-mark 9 [187 9] [9655 9] [92 9]) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
    ))
(setq whitespace-style '(face trailing empty))

;; (set-face-attribute 'whitespace-tab nil
;;                     :foreground "gray27"
;;                     :weight 'bold)
(set-face-attribute 'whitespace-trailing nil
                    :foreground "#183bc8"
                    :weight 'normal)
(global-whitespace-mode t)
(add-hook 'before-save-hook 'whitespace-cleanup)

(add-hook 'org-mode-hook
          (lambda ()
            ;; (setq evil-mode nil)
            (setq whitespace-style nil)))

(use-package spaceline-config
  :ensure spaceline
  :config
  (setq powerline-height 25)
  (setq powerline-raw " ")
  ;; (setq ns-use-srgb-colorspace nil)
  (spaceline-spacemacs-theme)
  (spaceline-helm-mode 1)
  (setq powerline-default-separator 'nil)
  (spaceline-toggle-projectile-root-on)
  ;; (spaceline-toggle-nyan-cat-on)
  ;; (spaceline-toggle-org-clock-on)
  (spaceline-toggle-minor-modes-off)
  (spaceline-toggle-buffer-modified-on)
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
  (spaceline-define-segment me/project-id
    "Name of project, or folder"
    (propertize
     (amitp/shorten-directory
      (cond (buffer-file-name (amitp/project-root-for-file buffer-file-name))
            (t (amitp/project-root-for-directory default-directory)))
      (- (window-width) (length (amitp/spaceline-buffer-id)) 60))
     'face 'amitp/spaceline-filename))
  (spaceline-compile)
)


;; (use-package all-the-icons)
;; (use-package spaceline)
;; (use-package spaceline-all-the-icons
;;   :after spaceline
;;   :config
;;   (spaceline-all-the-icons-theme)
;; (setq spaceline-all-the-icons-separator-type 'none)
;; (spaceline-toggle-all-the-icons-sun-time-on )
;; (spaceline-toggle-all-the-icons-git-stats-on))
;; (use-package all-the-icons-dired)


;; (set-face-attribute 'spaceline-evil-emacs nil :background "#be84ff" :weight 'bold)
;; (set-face-attribute 'spaceline-evil-insert nil :background "#a6e22e" :weight 'bold)
;; (set-face-attribute 'spaceline-evil-motion nil :background "#ae81ff" :weight 'bold)
;; (set-face-attribute 'spaceline-evil-normal nil :background "#5fd7ff" :weight 'bold)
;; (set-face-attribute 'spaceline-evil-replace nil :background "#f92672":weight 'bold)
;; (set-face-attribute 'spaceline-evil-visual nil :background "#fd971f" :weight 'bold)

; (use-package flycheck
;   :init (global-flycheck-mode nil))

(use-package rainbow-delimiters
    :commands (rainbow-delimiters-mode)
    :init
    (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package magit
    :commands (magit-status
               magit-diff
               magit-commit
               magit-log
               magit-push
               magit-stage-file
               magit-unstage-file))

(use-package projectile
  :diminish projectile-mode
  :config
  ;; (setq projectile-require-project-root nil)
  (setq projectile-keymap-prefix (kbd "\C-xp"))
  (setq projectile-completion-system 'default)
  (setq projectile-enable-caching nil)
  (setq projectile-indexing-method 'alien)
  (add-to-list 'projectile-globally-ignored-files "node-modules")
  (projectile-global-mode))

(use-package helm-projectile)

(use-package yaml-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode)))
(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

(linum-mode)
;; line numers format
(set-face-foreground 'linum "DarkSeaGreen")
(setq linum-format "%4d ")
(linum-mode -1)

;; ;; Reverse colors for the border to have nicer line
(set-face-inverse-video-p 'vertical-border nil)
(set-face-background 'vertical-border (face-background 'default))

(defun my-change-window-divider ()
  (let ((display-table (or buffer-display-table standard-display-table)))
    (set-display-table-slot display-table 5 ?│)
    (set-window-display-table (selected-window) display-table)))

(add-hook 'window-configuration-change-hook 'my-change-window-divider)

;; ;; Set symbol for the border
;; (set-display-table-slot standard-display-table
;;                         'vertical-border
;;                         (make-glyph-code ?┃))

(use-package org-trello
  :ensure t
  :config
  (custom-set-variables '(org-trello-files '("~/org/personal.org" ))))

(use-package helm
  :diminish helm-mode
  :init
  (progn
    (require 'helm-config)
    (setq helm-candidate-number-limit 100)
    ;; From https://gist.github.com/antifuchs/9238468
    (setq helm-idle-delay 0.0 ; update fast sources immediately (doesn't).
          helm-input-idle-delay 0.01  ; this actually updates things
                                        ; reeeelatively quickly.
          helm-yas-display-key-on-candidate t
          helm-quick-update t
          helm-M-x-requires-pattern nil
          helm-mode-fuzzy-match t
          helm-ff-skip-boring-files t)
    (helm-mode))
  :bind (("C-c h" . helm-mini)
         ("C-h a" . helm-apropos)
         ("C-x C-b" . helm-buffers-list)
         ("C-x b" . helm-buffers-list)
         ("M-y" . helm-show-kill-ring)
         ("M-x" . helm-M-x)
         ("C-x c o" . helm-occur)
         ("C-x c s" . helm-swoop)
         ("C-x c y" . helm-yas-complete)
         ("C-x c Y" . helm-yas-create-snippet-on-region)
         ("C-x c b" . my/helm-do-grep-book-notes)
         ("C-x c SPC" . helm-all-mark-rings)))
(ido-mode -1) ;; Turn off ido mode in case I enabled it accidentally

;; helm movement fixed
(define-key helm-map (kbd "C-j") 'helm-next-line)
(define-key helm-map (kbd "C-k") 'helm-previous-line)


(use-package helm-ag)

(use-package guide-key
  :defer t
  :diminish guide-key-mode
  :config
  (progn
  (setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-c"))
  (guide-key-mode 1)))  ; Enable guide-key-mode

(use-package undo-tree
  :diminish undo-tree-mode
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)))

(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

(use-package helm-swoop
 :bind
 (("C-S-s" . helm-swoop)
  ("M-i" . helm-swoop)
  ("M-s s" . helm-swoop)
  ("M-s M-s" . helm-swoop)
  ("M-I" . helm-swoop-back-to-last-point)
  ("C-c M-i" . helm-multi-swoop)
  ("C-x M-i" . helm-multi-swoop-all)
  )
 :config
 (progn
   (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
   (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop))
)

(use-package expand-region)
;; (bind-key "M-/" 'hippie-expand)

;; (use-package yasnippet
;;   :ensure t
;;   :diminish yas-minor-mode
;;   :init (yas-global-mode)
;;   :config
;;   (progn
;;     (yas-global-mode)
;;     (add-hook 'hippie-expand-try-functions-list 'yas-hippie-try-expand)
;;     (setq yas-key-syntaxes '("w_" "w_." "^ "))
;;     (setq yas-installed-snippets-dir "~/.emacs.d/snippets")
;;     (setq yas-expand-only-for-last-commands nil)
;;     (yas-global-mode 1)
;;     (bind-key "\t" 'hippie-expand yas-minor-mode-map)
;;     (add-to-list 'yas-prompt-functions 'shk-yas/helm-prompt)))

(use-package multiple-cursors
  :ensure t
  :bind
   (("C-c m t" . mc/mark-all-like-this)
    ("C-c m m" . mc/mark-all-like-this-dwim)
    ("C-c m l" . mc/edit-lines)
    ("C-c m e" . mc/edit-ends-of-lines)
    ("C-c m a" . mc/edit-beginnings-of-lines)
    ("C-c m n" . mc/mark-next-like-this)
    ("C-c m p" . mc/mark-previous-like-this)
    ("C-c m s" . mc/mark-sgml-tag-pair)
    ("C-c m d" . mc/mark-all-like-this-in-defun)))

(use-package sr-speedbar
  :ensure t
  :config
  (global-set-key (kbd "C-c t") 'sr-speedbar-toggle))

;; (setq custom-file "~/.emacs.d/custom/spelling.el")
;; (load custom-file 'noerror)


;; (defconst user-init-dir
;;   (cond ((boundp 'user-emacs-directory)
;;          user-emacs-directory)
;;         ((boundp 'user-init-directory)
;;          user-init-directory)
;;         (t "~/.emacs.d/")))

;; (defun load-user-file (file)
;;   (interactive "f")
;;   "Load a file in current user's configuration directory"
;;   (load-file (expand-file-name file user-init-dir)))


;; Spelling
;; (dolist (hook '(text-mode-hook))
;;   (add-hook hook (lambda () (flyspell-mode 1))))

;; (dolist (mode '(emacs-lisp-mode-hook
;;                 inferior-lisp-mode-hook
;;                 clojure-mode-hook
;;                 python-mode-hook
;;                 ruby-mode-hook))
;;   (add-hook mode
;;             '(lambda ()
;;                (flyspell-prog-mode))))

;; (global-set-key (kbd "<f8>") 'ispell-word)
;; (defun flyspell-check-next-highlighted-word ()
;;   "Custom function to spell check next highlighted word"
;;   (interactive)
;;   (flyspell-goto-next-error)
;;   (ispell-word))
;; (global-set-key (kbd "M-<f8>") 'flyspell-check-next-highlighted-word)

;; (setq ispell-program-name "/usr/local/bin/aspell")
;; ;; Please note ispell-extra-args contains ACTUAL parameters passed to aspell
;; (setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US"))


;; Golang support
(defun set-exec-path-from-shell-PATH ()
"Sets the exec-path to the same value used by the user shell"
  (let ((path-from-shell
         (replace-regexp-in-string
"[[:space:]\n]*$" ""
          (shell-command-to-string "$SHELL -l -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
;; call function now
(set-exec-path-from-shell-PATH)

(use-package exec-path-from-shell)
(use-package go-mode)
(use-package gorepl-mode)
(use-package go-autocomplete)
(use-package flymake-go)


(setenv "GOPATH" "/Users/rzaytsev/dev/go/")
(add-to-list 'exec-path "/Users/rzaytsev/dev/go/bin")
(setq gofmt-command "goimports")
(add-hook 'before-save-hook #'gofmt-before-save)

(defun my-go-mode-hook ()
  (setenv "GOPATH" "/Users/rzaytsev/dev/go/")
  (add-to-list 'exec-path "/Users/rzaytsev/dev/go/bin")
  (setq exec-path (append exec-path '("/usr/local/opt/go/libexec/")))
  (setq gofmt-command "goimports")
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
)
(add-hook 'go-mode-hook 'my-go-mode-hook)
;; (add-hook 'go-mode-hook #'gorepl-mode)

;; (use-package go-mode-autoloads)


(use-package quickrun
  :config
  ;; (setq quickrun-focus-p nil)
  (setq quickrun-timeout-seconds nil))
;; https://github.com/syohex/emacs-quickrun

(quickrun-add-command "gorun"
  '((:command . "go")
    (:exec    . "%c run *.go")
    (:tempfile . nil))
  :mode 'go-mode)
(quickrun-set-default "go" "gorun")

;; Powershell support
(use-package powershell)


;; (use-package sublimity)
;; ;; (use-ackage sublimity-scroll)          ;
;; (use-package sublimity-map) ;; experimental
;; (use-package sublimity-attractive)

;; (setq sublimity-map-size 20)
;; (setq sublimity-map-fraction 0.3)
;; (setq sublimity-map-text-scale -7)

;; (add-hook 'sublimity-map-setup-hook
;;           (lambda ()
;;             (setq buffer-face-mode-face '(:family "Monospace"))
;;             (buffer-face-mode)))

;; (sublimity-mode 1)

(use-package mode-icons
  :init
  (mode-icons-mode))


(use-package neotree
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))


(use-package dockerfile-mode)

;; http://web-mode.org
(use-package web-mode)


(message "config loaded!")
(provide 'init)
;;; init.el ends here
