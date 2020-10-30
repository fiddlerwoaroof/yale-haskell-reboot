;;; cl-init.lisp -- initialize Common Lisp, loading cl-specific files.
;;;
;;; author :  Sandra Loosemore
;;; date   :  23 Oct 1991
;;;
;;; All of the files loaded here are assumed to be regular Common Lisp
;;; files.


;;; Do NOT change the load order of these files.



;;; It would be nice if at this point we could switch *package*
;;; over to the right package.  But because *package* is rebound while 
;;; this file is being loaded, it will get set back to whatever it was 
;;; anyway.  Bummer.  Well, let's at least make the package that we want 
;;; to use.


;;; Compile and load the rest of the system.  (The Lucid compiler is fast
;;; enough to make it practical to compile things all the time.)

(eval-when  (:execute :compile-toplevel :load-toplevel)
  (setf cl:*default-pathname-defaults* (truename "..")))

(in-package :MUMBLE-USER)

(load "support/system")
(compile-haskell)


;;; All done

(write-line "Remember to do (in-package \"MUMBLE-USER\")!")
