;; Window Layout (currently configured for a large 4K display)
;; TODO: Do a "macro" to generate layout for
;; TODO: different screen sizes.
;; Website: https://github.com/kiwanami/emacs-window-layout

(use-package window-layout
  :ensure t
  :config
  (setq wm-height-ratio 0.5)
  (setq wm ; <-- window management object
        (wlf:layout
         '(| (:left-size 95)
             (- (:upper-size-ratio wm-height-ratio) p0-top p0-bot)
             (| (:left-size 95)
                (- (:upper-size-ratio wm-height-ratio) p1-top p1-bot)
                (| (:left-size 95)
                   (- (:upper-size-ratio wm-height-ratio) p2-top p2-bot)
                   (| (:left-size 95)
                      (- (:upper-size-ratio wm-height-ratio) p3-top p3-bot)
                      (| (:left-size 95)
                         (- (:upper-size-ratio wm-height-ratio) p4-top p4-bot)
                         (- (:upper-size-ratio wm-height-ratio) p5-top p5-bot))
                      ))))
         '((:name p0-top :buffer "p0 top")
           (:name p0-bot :buffer "p0 bot")
           (:name p1-top :buffer "p1 top")
           (:name p1-bot :buffer "p1 bot")
           (:name p2-top :buffer "p2 top")
           (:name p2-bot :buffer "p2 bot")
           (:name p3-top :buffer "p3 top")
           (:name p3-bot :buffer "p3 bot")
           (:name p4-top :buffer "p4 top")
           (:name p4-bot :buffer "p4 bot")
           (:name p5-top :buffer "p5 top")
           (:name p5-bot :buffer "p5 bot")
           ))))

(provide 'window-layout-ext)
