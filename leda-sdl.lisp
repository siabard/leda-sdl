;;;; leda-sdl.lisp

(in-package #:leda-sdl)


(defun clear-renderer (renderer)
  (progn
    (sdl2:set-render-draw-color renderer 0 0 0 255)
    (sdl2:render-clear renderer)))

(defun basic-main ()
  (sdl2:with-init (:everything)
    (format t "Using SDL Library Version: ~D. ~D. ~D~%"
	    sdl2-ffi:+sdl-major-version+
	    sdl2-ffi:+sdl-minor-version+
	    sdl2-ffi:+sdl-patchlevel+)
    (finish-output)

    (sdl2:with-window (win :flags '(:shown :opengl))
      (sdl2:with-gl-context (gl-context win)
	(sdl2:with-renderer (renderer win :flags '(:accelerated))
	  (progn
	    (sdl2-image:init '(:png :jpg))
	    (let* ((img-surface (sdl2-image:load-image (asdf:system-relative-pathname :leda-sdl "assets/grass_tile.png")))
		   (img-texture (sdl2:create-texture-from-surface renderer img-surface )))
	      (sdl2:with-event-loop (:method :poll)
		(:keydown (:keysym keysym)
			  (let ((scancode (sdl2:scancode-value keysym)))
			    (cond
			      ((sdl2:scancode= scancode :scancode-escape) (sdl2:push-event :quit)))))
		(:idle ()
		       (clear-renderer renderer)
		       (sdl2:render-copy renderer img-texture)
		       (sdl2:render-present renderer))
		(:quit () t)))))))
    ))
