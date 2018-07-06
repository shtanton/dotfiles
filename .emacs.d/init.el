
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load-theme 'nord t)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'load-path "/home/charlie/.emacs.d/scripts/ace-jump-mode")
(add-to-list 'load-path "/home/charlie/.emacs.d/scripts/lsp-mode")


(require 'package)
(require 'lsp-mode)
(require 'company-lsp)
(require 'lsp-javascript-typescript)

(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(add-hook
 'javascript-mode-hook
 #'lsp-javascript-typescript-enable)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(electric-pair-mode 1)

(setq-default tab-width 2)

(define-key global-map (kbd "C-k") 'kill-whole-line)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
	 (quote
		(lsp-javascript-typescript company company-lsp js2-mode magit nord-theme rjsx-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
