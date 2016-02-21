;; TODO - Clean up this shit

;; Ok we fixed the first problem of having stuff not load
(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

;; General behavior config
(setq ring-bell-function 'ignore)
(delete-selection-mode 1)
(setq default-tab-width 2)

(setq sgml-basic-offset 2)
(setq c-basic-offset 4)
(setq js-indent-level 2)
(setq-default indent-tabs-mode nil)
(set-default 'truncate-lines nil)
(setq truncate-partial-width-windows nil)

                                        ;disable backup
(setq backup-inhibited t)
                                        ;disable auto save
(setq auto-save-default nil)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(load-theme 'dark-blue2 t t)
(enable-theme 'dark-blue2)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
                                        ;(rvm-use-default)
(windmove-default-keybindings 'meta)
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)
(setq framemove-hook-into-windmove t)

(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . web-mode))
                                        ;(autopair-global-mode)

;; (defun sass-indent-p ()
;;   "Return t if the current line can have lines nested beneath it."
;;   (unless (or (looking-at "^.* :.*$")
;;               (looking-at "^.*: .*$"))
;;     (loop for opener in sass-non-block-openers
;;           if (looking-at opener) return nil
;;           finally return t)))
(put 'downcase-region 'disabled nil)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

; Using django for now
(setq web-mode-engines-alist
      '(("django"    . "\\.html\\'")
        ("blade"  . "\\.blade\\."))
)

(setq-default indent-tabs-mode nil)
(setq web-mode-code-indent-offset 2)
(setq web-mode-indent-style 2)

;; must install wmctrl
(defun switch-full-screen ()
  (interactive)
  (shell-command "wmctrl -r :ACTIVE: -btoggle,maximized_vert,maximized_horz"))

(global-set-key [f11] 'switch-full-screen)

(defun delete-word (arg)
  "Delete characters forward until encountering the end of a word.
With argument, do this that many times."
  (interactive "p")
  (delete-region (point) (progn (forward-word arg) (point))))

(defun backward-delete-word (arg)
  "Delete characters backward until encountering the end of a word.
With argument, do this that many times."
  (interactive "p")
  (delete-word (- arg)))

(global-set-key (read-kbd-macro "<C-backspace>") 'backward-delete-word)

(add-hook 'text-mode-hook 'flyspell-mode)

; Magit
(global-set-key (kbd "C-x g") 'magit-status)

; disable the touchpad whilst in emacs
(dolist (k '([mouse-1] [down-mouse-1] [drag-mouse-1] [double-mouse-1] [triple-mouse-1]  
             [mouse-2] [down-mouse-2] [drag-mouse-2] [double-mouse-2] [triple-mouse-2]
             [mouse-3] [down-mouse-3] [drag-mouse-3] [double-mouse-3] [triple-mouse-3]
             [mouse-4] [down-mouse-4] [drag-mouse-4] [double-mouse-4] [triple-mouse-4]
             [mouse-5] [down-mouse-5] [drag-mouse-5] [double-mouse-5] [triple-mouse-5]))
  (global-unset-key k))

; (setq dired-dwim-target t)
(setq tramp-default-method "sftp")

; For SCSS mode
(setq scss-sass-options '("-t" "compressed"))
(setq tramp-verbose 9)

; Trying out Ace Jump
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)
