;;;; leda-sdl.asd

(asdf:defsystem #:leda-sdl
  :description "Describe leda-sdl here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :depends-on (sdl2 sdl2-image cl-tiled)
  :serial t
  :components ((:file "package")
               (:file "leda-sdl")))
