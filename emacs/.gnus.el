
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; email and newsgroup account
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq gnus-secondary-select-methods
      '(
        (nntp "newsfan"
              (nntp-address "south.newsfan.net"))
        (nnimap "yeah"
                (nnimap-address "imap.yeah.net")
                (nnimap-server-port 993)
                (nnimap-stream ssl)
                (nnimap-authinfo-file "~/authinfo"))
        ))
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-default-smtp-server "smtp.yeah.net")

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; gnus encoding
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; group name charset
(setq gnus-group-name-charset-method-alist
      '(((nntp "newsfan") . chinese-gbk)))

;; reading charset (group basis)
;; (add-hook 'gnus-load-hook
;;           (lambda nil
;;             (setq gnus-default-charset 'cn-gb-2312)
;;             (setq gnus-group-charset-alist (quote ((".*" chinese-gbk))))))
(setq gnus-group-charset-alist '((".*" chinese-gbk)))
;; (setq gnus-group-charset-alist (quote ((".*" chinese-iso-8bit))))
;; (add-to-list 'gnus-group-charset-alist
;;              '(".*" chinese-gbk))

(setq mm-coding-system-priorities (quote (chinese-gbk)))

;; posting charset (group basis)
;; (add-to-list 'gnus-newsgroup-variables 'mm-coding-system-priorities)
;; (setq gnus-parameters
;;       (nconc
;;        '((".*"
;;           (mm-coding-system-priorities
;;            '(gbk utf-8))))
;;        gnus-parameters))

(setq nnmail-pathname-coding-system (quote utf-8))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; gnus format
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq gnus-summary-line-format "%U%R%z %(%&user-date;  %-15,15n  %B (%c) %s%)\n")
(setq gnus-thread-sort-functions (quote (gnus-thread-sort-by-most-recent-number)))
;; (setq gnus-article-sort-functions (quote (gnus-summary-sort-by-most-recent-date)))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; gnus user profile
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq user-full-name "拉瓦")
(setq user-mail-address "wenjie_yu@yeah.net")
(setq gnus-posting-styles
      (quote
       ((".*"
         (name "拉瓦")
         (address "wenjie_yu@yeah.net")
         (signature "时间就像女人的乳沟")))))
