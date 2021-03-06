#!/usr/local/bin/sbcl --script
;;; Want to avoid compiler warnings, so add defvar for these variables

; Collatz Sequencer in Lisp
; Nolan Donley
; Input: None
; Output: Top 5 smallest integers under 5 Billion with the longest collatz sequence
;
; To compile and run:
;  sbcl --script cseq.lisp

(setq *print-pretty* 'nil)
(defvar startingNum) ; var for starting iterator
(defvar j) ; iterator
(defvar out) ; iterator
(defvar sOut) ; iterator
(defvar i) ; iterator
(defvar maxNum 5000000000) ; 5 billion
(defvar maxLength 1132) ; size : max collatz sequence for 10^10
(defvar countSeq 1) ; sequence counter var
(defvar outputCount 9) ; number of indexes to output
(defvar smallest) ;  array of size : max collatz sequence for 10^10
(defvar sequenceList) ; array for of top 10 lengths' starting numbers
(defvar indexes) ;array for top 10 lengths
(defvar sortedIndexes) ;  array for top 10 lengths' starting Numbres sorted
(defvar tmp) ; used to sort

;; main method
(defun mainmethod()
  (declare (optimize (speed 3) (safety 0)))
  ;calculate the sequence length
  (loop for startingNum from 1 to maxNum do
    (setf i startingNum)
    (loop while (not (= i 1)) do
      (incf countSeq)
      (if (= (mod i 2) 0)
        (setf i (/ i 2))
        (progn
        (setf i (/ (+ (* i 3) 1) 2)) (incf countSeq))))
    ;store the first starting num that results in that length in length index of smallest
    (if (equal (aref smallest countSeq) 0)
    (setf (aref smallest countSeq) startingNum))
    (setf countSeq 0)
  )
)

; move top 10 lengths and starting numbers to lengths and indexes respectivly
(defun transfer()
  (loop for x from (- maxLength 1) downto 0 do
    (if (not (= (aref smallest x) 0))
    (if (> outputCount -1)
    (progn
      (setf (nth outputCount sequenceList) (list x (aref smallest x)))
      (decf outputCount)))))
)

;;Print out top 10 sorted by lengths
(defun printOut()
  (format t "~%~15a~15a~%" "Length" "Starting")
  (loop for el in sequenceList do
    (format t "~15a~15a~%" (car el) (cadr el)))
  ;Sort the starting nums
  (bubble-sort sequenceList 'compareList)

  ;Print out top 10 sorted by starting nums
  (format t "~%~15a~15a~%" "Starting" "Length")
  (loop for el in sequenceList do
    (format t "~15a~15a~%" (cadr el) (car el)))
)

(defun compareList (a b)
  (<= (nth 1 a) (nth 1 b))
)

(defun bubble-sort (sequence &optional (compare #'<))
  "sort a sequence (array or list) with an optional comparison function (cl:< is the default)"
  (loop with sorted = nil until sorted do
        (setf sorted t)
        (loop for a below (1- (length sequence)) do
              (unless (funcall compare (elt sequence a)
                                       (elt sequence (1+ a)))
                (rotatef (elt sequence a)
                         (elt sequence (1+ a)))
                (setf sorted nil)))))

(setf smallest (make-array maxLength))
(setq sequenceList (make-list 10))
(mainmethod)
(transfer)
(printOut)
