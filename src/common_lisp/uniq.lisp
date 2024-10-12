(defun uniq ()
  (let ((prev-line ""))
    (loop for line = (read-line *standard-input* nil :eof)
          until (eq line :eof)
          do (unless (string= line prev-line) (write-line line))
          do (setq prev-line line))))

(uniq)
