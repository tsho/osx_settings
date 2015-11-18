(setq make-backup-files nil)

;;; YaTeX (野鳥)----------------------------------
;; yatex-mode を起動させる設定
(add-to-list 'load-path "~/.emacs.d/site-lisp/yatex")
(setq auto-mode-alist 
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

;; 野鳥が置いてある directry の load-path 設定
;; default で load-path が通っている場合は必要ありません
;(setq load-path
;      (cons (expand-file-name
					;     "/Applications/Emacs.app/Contents/Resources/site-lisp/yatex") load-path))

;; 文章作成時の漢字コードの設定
;; 1 = Shift_JIS, 2 = ISO-2022-JP, 3 = EUC-JP, 4 = UTF-8
;; default は 3
;:(setq YaTeX-kanji-code 3) ; euc-jp

;LaTeXコマンドの設定
(setq tex-command "platex")
;YaTeXでのプレビューアコマンドを設定する
;;(setq dvi2-command "xdvi")
;AMS-LaTeX を使用する
(setq YaTeX-use-AMS-LaTeX t)

;; dvipdfmxによるPDF変換
(setq dviprint-command-format "dvipdfmx %s")
;; use Preview.app
(setq dvi2-command "open -a Preview")
(setq bibtex-command "pbibtex")

;YaTeXでコメントアウト、解除を割り当てる
;;(add-hook 'yatex-mode-hook
;;	    '(lambda ()
;;	            (local-set-key "\C-c\C-c" 'comment-region)
;;		         (local-set-key "\C-c\C-u" 'uncomment-region) ))


; RefTeXをYaTeXで使えるようにする
(add-hook 'yatex-mode-hook '(lambda () (reftex-mode t)))
; RefTeXで使うbibファイルの位置を指定する
;(setq reftex-default-bibliography '("~/Library/TeX/bib/papers.bib"))


;;RefTeXに関する設定
(setq reftex-enable-partial-scans t)
(setq reftex-save-parse-info t)
(setq reftex-use-multiple-selection-buffers t)
;;RefTeXにおいて数式の引用を\eqrefにする
(setq reftex-label-alist '((nil ?e nil "~\\eqref{%s}" nil nil)))


;;(defun shell-command-sequence (concat "open -a Preview " stem ".pdf")
(defun shell-command-sequence (cmd &rest others)
  (mapc 'shell-command `(,cmd ,@others)))


;; c+c, c+c
(defun yatex-typeset-and-preview ()
  (interactive)
  (let* ((f (buffer-file-name))
         (dir (file-name-directory f))
         (stem (file-name-sans-extension f)))
    (save-excursion
      (basic-save-buffer)
      (shell-command-sequence (concat "cd " dir)
                              (concat "platex " f)
                              (concat "dvipdfmx " stem ".dvi")
                              (concat "rm " stem ".dvi")
;;                              (concat "rm " stem ".aux") ;; ここはコメントアウトすべきかも
                              (concat "rm " stem ".log")
			      (concat "open -a Preview " stem ".pdf")))))
;;      (pop-to-buffer (find-file-noselect (concat stem ".pdf"))) 

;; c+c, c+r
(defun yatex-typeset-and-preview-region (beg end)
  (interactive "r")
  (let* ((f (file-name-nondirectory (buffer-file-name)))
         (tmpfile (concat "/tmp/" f))
         (stem (file-name-sans-extension tmpfile))
         (contents (buffer-substring-no-properties beg end))
         header)
    (save-excursion
      (goto-char (point-min))
      (re-search-forward "\\\\begin{document}")
      (setq header (buffer-substring-no-properties (point-min) (1+ (match-end 0))))
      (set-buffer (find-file-noselect tmpfile))
      (insert header)
      (insert contents)
      (insert "\\end{document}")
      (unwind-protect
          (yatex-typeset-and-preview)
        (shell-command (concat "rm " tmpfile))
        (kill-buffer (current-buffer))))))

(add-hook 'yatex-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-c") 'yatex-typeset-and-preview)
            (local-set-key (kbd "C-c C-r") 'yatex-typeset-and-preview-region)))
;---------------------------------(YaTeXここまで)--------

;;; 対応する括弧を光らせる。
(show-paren-mode 1)
;;; 選択部分をハイライト
(transient-mark-mode t)
;;; バックアップファイルを作らない
(setq backup-inhibited t)
;;; スタートアップメッセージを非表示
(setq inhibit-startup-message t)
;; key bind
(global-set-key "\C-h" 'backward-delete-char)
;; show unuseful whitespace
(setq-default show-trailing-whitespace t)
;(setq show-paren-style 'parenthesis) 


;; Load Files
(add-to-list 'load-path "~/.emacs.d/site-lisp")
;; Haml
(require 'haml-mode)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))

;; .rake ruby mode
 (load-library "ruby-mode") 
 (require 'ruby-mode)
 (setq auto-mode-alist
       (append '(("\\.rake$" . ruby-mode))
           auto-mode-alist))

(add-hook 'python-mode-hook
    '(lambda ()
        (setq python-indent 2)
        (setq indent-tabs-mod nil)
        (define-key (current-local-map) "\C-h" 'python-backspace)
    ))


;; octave mode
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))
(add-hook 'octave-mode-hook
	  (lambda ()
	    (abbrev-mode 1)
	    (auto-fill-mode 1)
	    (if (eq window-system 'x)
		                     (font-lock-mode 1))))
