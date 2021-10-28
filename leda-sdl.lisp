;;;; leda-sdl.lisp

(in-package #:leda-sdl)

(defun basic-main ()
  (sdl2:with-init (:everything)
    (format t "Using SDL Library Version: ~D. ~D. ~D~%"
	    sdl2-ffi:+sdl-major-version+
	    sdl2-ffi:+sdl-minor-version+
	    sdl2-ffi:+sdl-patchlevel+)
    (finish-output)

    (sdl2:with-window (win :flags '(:shown :opengl))
      (sdl2:with-gl-context (gl-context win)
	(sdl2:with-event-loop (:method :poll)
	  (:keydown (:keysym keysym)
		    (let ((scancode (sdl2:scancode-value keysym)))
		      (cond
			((sdl2:scancode= scancode :scancode-escape) (sdl2:push-event :quit)))))
	  (:quit () t))))))
