;; TODO - Clean up this shit

;; Ok we fixed the first problem of having stuff not load
(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

;; General behavior config
(setq ring-bell-function 'ignore)
(delete-selection-mode 1)
(setq default-tab-width 4)

(setq sgml-basic-offset 2)
(setq c-basic-offset 4)
(setq js-indent-level 2)
(setq-default indent-tabs-mode nil)

;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)

(tool-bar-mode -1)
(scroll-bar-mode -1)

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
(setq-default indent-tabs-mode nil)
(setq web-mode-code-indent-offset 4)
(setq web-mode-indent-style 4)
