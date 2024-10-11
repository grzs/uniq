#!/usr/bin/emacs -x

(defun uniq ()
  (let ((line) (prev-line))
    (condition-case nil
        (while t
          (setq line (read-string ""))
          (unless (string= line prev-line)
            (princ line) (princ "\n"))
          (setq prev-line line))
      (end-of-file nil))))

(uniq)
