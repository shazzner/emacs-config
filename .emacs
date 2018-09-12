;; TODO - Clean up this shit

;; Ok we fixed the first problem of having stuff not load

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

;; General behavior config
(setq ring-bell-function 'ignore)
(delete-selection-mode 1)
(setq default-tab-width 2)

(setq sgml-basic-offset 2)
(setq c-basic-offset 2)
(setq js-indent-level 2)
(setq-default indent-tabs-mode nil)
(setq truncate-lines 'nil)
(setq org-startup-truncated nil) ; this worked for org-mode!
(setq org-startup-indented t)
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
                                        ;                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ))
                                        ;(rvm-use-default)
(windmove-default-keybindings 'meta)
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)
(setq framemove-hook-into-windmove t)

(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))

(require 'package)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(package-initialize)
(elpy-enable)
                                        ;(add-to-list 'auto-mode-alist '("\\.py\\'" . elpy-mode))
                                        ;(autopair-global-mode)

;; (defun sass-indent-p ()
;;   "Return t if the current line can have lines nested beneath it."
;;   (unless (or (looking-at "^.* :.*$")
;;               (looking-at "^.*: .*$"))
;;     (loop for opener in sass-non-block-openers
;;           if (looking-at opener) return nil
;;           finally return t)))
(put 'downcase-region 'disabled nil)

                                        ; Let's kill back to _ instead of whole word
(modify-syntax-entry ?_ "_")
(defun change-major-mode-hook ()
  (modify-syntax-entry ?_ "_"))

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

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-sql-indent-offset 2)


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
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

                                        ; disable the touchpad whilst in emacs
;; (dolist (k '([mouse-1] [down-mouse-1] [drag-mouse-1] [double-mouse-1] [triple-mouse-1]  
;;              [mouse-2] [down-mouse-2] [drag-mouse-2] [double-mouse-2] [triple-mouse-2]
;;              [mouse-3] [down-mouse-3] [drag-mouse-3] [double-mouse-3] [triple-mouse-3]
;;              [mouse-4] [down-mouse-4] [drag-mouse-4] [double-mouse-4] [triple-mouse-4]
;;              [mouse-5] [down-mouse-5] [drag-mouse-5] [double-mouse-5] [triple-mouse-5]))
;;   (global-unset-key k))

                                        ; (setq dired-dwim-target t)
                                        ;(setq tramp-default-method "sftp")
(setq tramp-copy-size-limit nil)


                                        ; For SCSS mode
(setq scss-compile-at-save nil)
                                        ;(setq scss-sass-options '("-t" "compressed"))


                                        ; Trying out Ace Jump
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

                                        ; ???
(setq tramp-verbose 9)
(setq tramp-inline-compress-start-size 1000000)

                                        ;(setq org-latex-to-pdf-process 
                                        ;  '("xelatex -interaction nonstopmode %f"
                                        ;     "xelatex -interaction nonstopmode %f"))

                                        ;(require 'org-latex)
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))
(add-to-list 'org-export-latex-classes
             '("memoir"
               "\\documentclass[letterpaper,11pt,twocolumn,openany]{memoir}
                [PACKAGES]
                \\usepackage{memoir-article-style}
                [NO-DEFAULT-PACKAGES]"
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")       
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
             )

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

                                        ; Keep elpy from overriding meta-arrow key behavior
(eval-after-load "elpy"
  '(cl-dolist (key '("M-<up>" "M-<down>" "M-<left>" "M-<right>"))
     (define-key elpy-mode-map (kbd key) nil)))


(add-to-list 'auto-mode-alist '("src\\/.*\\.js\\'" . rjsx-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (rjsx-mode yaml-mode dockerfile-mode toml toml-mode rust-mode rainbow-mode lorem-ipsum php-mode vagrant-tramp elpy company web-mode typescript tide neotree nav magit ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Hex-colors, use rainbow-mode instead

(setq ps-lpr-command "print_preview")
