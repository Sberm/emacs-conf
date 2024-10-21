;; todo
;; clipboard
;; auto comment
;; quick comment
;; syntax highlight
;; tabs indentation
;; set list alternative

(display-line-numbers-mode)

(hl-line-mode)

;; theme
(load-theme 'lucius)

;; use <Shift-Arrow> to quickly jumps from windows
(windmove-default-keybindings)

;; disable some bars
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

;; quickly jumps from tabs
(global-set-key (kbd "<C-right>") 'tab-next)
(global-set-key (kbd "<C-left>") 'tab-previous)
(global-set-key (kbd "C-t") 'tab-new)

;; unbind C-a because of tmux
(global-set-key (kbd "C-a") nil)
(global-set-key (kbd "C-q") 'move-beginning-of-line)


;; ========= fzf ========== start
;; set prefix key C-\
(defvar-keymap leader-key-map
  "\\" #'leader)
(keymap-set global-map "C-\\" leader-key-map)

(use-package fzf
  :bind
  ("C-\\ f" . 'fzf)
  ("C-\\ s" . 'fzf-grep)
  :config
  (setq fzf/args "-x --color bw --print-query --margin=1,0 --no-hscroll"
        fzf/executable "fzf"
        fzf/git-grep-args "-i --line-number %s"
        fzf/grep-command "rg --no-heading -nH"
        fzf/position-bottom t
        fzf/window-height 50))

;; ========= fzf ========== end


;; ========= dired sidebar ========== start
(use-package dired-sidebar
  :ensure t
  :commands (dired-sidebar-toggle-sidebar))

(use-package dired-sidebar
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :init
  (add-hook 'dired-sidebar-mode-hook
            (lambda ()
              (unless (file-remote-p default-directory)
                (auto-revert-mode))))
  :config
  (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
  (push 'rotate-windows dired-sidebar-toggle-hidden-commands)

  (setq dired-sidebar-subtree-line-prefix "__")
  (setq dired-sidebar-theme 'vscode)
  (setq dired-sidebar-use-term-integration t)
  (setq dired-sidebar-use-custom-font t))

;; ========= dired sidebar ========== end

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("796b06b79496b03b01b8ce37382b28cf2364ee7129f48cdd1feb708e7803989f" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
