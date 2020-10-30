;;; system.scm -- haskell system setup
;;;
;;; author :  Sandra Loosemore
;;; date   :  22 Nov 1991
;;;
;;; This file loads in the compilation unit definition files for all
;;; of the components of the haskell system.  
;;;
;;; (The compilation unit facility is defined in support/shared/compile.scm.)


;;; First load the files containing module definitions.
;;; *** Add more files to the end of this list.  

(load "support/support")
(load "ast/ast")
(load "top/top")
(load "util/haskell-utils")
(load "printers/printers")
(load "parser/parser")
(load "import-export/ie.scm")
(load "tdecl/tdecl.scm")
(load "derived/derived.scm")
(load "prec/prec.scm")
(load "depend/depend.scm")
(load "type/type.scm")
(load "cfn/cfn.scm")
(load "flic/flic.scm")
(load "backend/backend.scm")
(load "runtime/runtime.scm")
(load "csys/csys")
(load "command-interface/command-interface")

;;; Define some functions to actually do the work.  The compilation unit 
;;; facility has conveniently kept a list of all of the unit definitions,
;;; so we can just rip through them in sequence.

(define (compile-haskell)
  (compile-and-load-unit-list compilation-units))

(define (recompile-haskell)
  (unless (null? remaining-units)
    (compile-and-load-unit-list remaining-units)))


(define (load-haskell)
  (load-unit-list compilation-units))

(define (reload-haskell)
  (unless (null? remaining-units)
    (load-unit-list remaining-units)))
