(in-package #:leda-sdl)

(defstruct atlas tiles map animation)

;; TODO
;; tile / map / animation 관련 Struct 구조 잡기
(defstruct tile-atlas width height tile-width tile-height tile-rects)


(defstruct map width height tile-wdith tile-height layers)


;; atlas내 tiles에 타일 RECT 정보를 넣기
;; tile-rect는 sdl2:rect 형이다.
(defun add-tile-to-atlas (atlas tile-name tile-rect)
  (setf (gethash tile-name (atlas-tiles atlas)) tile-rect))



;; atlas내 map에 map 정보를 넣기
(defun add-map-to-atlas (atlas map-name map-levels)
  (setf (gethash map-name (atlas-map atlas)) map-levels))

;; atlas내 animation에 animation 정보를 넣기
;; animation-rects는 aimation
(defun add-animation-atlas (atlas animation-name animation-rects)
  (setf (gethash animation-name (atlas-animation atlas)) animation-rects))
