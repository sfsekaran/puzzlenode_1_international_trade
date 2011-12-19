(require :asdf)
(asdf:load-system "quicklisp")
(ql:quickload :s-xml)
(ql:quickload :iterate)
(use-package :s-xml)
(use-package :iterate)

;; slurp stream
(defun slurp-stream4 (stream)
  (let ((seq (make-string (file-length stream))))
    (read-sequence seq stream)
    seq))

;; SAMPLE_RATES.xml
(defvar current-directory
  (make-pathname :directory (pathname-directory *load-pathname*)))
(defvar rates-path (merge-pathnames current-directory #p"SAMPLE_RATES.xml"))
(defvar sample-rates.xml (slurp-stream4 (open rates-path)))

;; sample-rates (parsed)
(defvar sample-rates (parse-xml-string sample-rates.xml))