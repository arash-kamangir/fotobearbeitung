(define (script-fu-beispiel)
	(let*
		(
			(autoImage
				(car
					(gimp-file-load
						RUN-NONINTERACTIVE
						"C:/temp/fotobearbeitung/Auto1/IMG_3511.JPG"
						""
					)
				)
			)
			(maske
				(car
					(gimp-file-load
						RUN-NONINTERACTIVE
						"C:/temp/fotobearbeitung/Maske_neu.png"
						""
					)
				)
			)
		)
		(let
			(
				(draw-autoImage 
					(car 
						(gimp-image-get-active-layer autoImage)
					)
				)
				(draw-maske 
					(car 
						(gimp-image-get-active-layer maske)
					)
				)
			)
				
			(gimp-edit-copy draw-maske)
			(gimp-floating-sel-anchor (car (gimp-edit-paste draw-autoImage TRUE)))
			(gimp-file-save RUN-NONINTERACTIVE autoImage draw-autoImage "C:/temp/fotobearbeitung/Auto1/out.jpg" "C:/temp/fotobearbeitung/Auto1/out.jpg")
		)
	)
)

(script-fu-register
    "script-fu-beispiel"                        ;func name
    "Beispielskript"                            ;menu label
    "Beispielskript."              				;description
    "Arash Shahi"                             	;author
    "copyright 2018, Arash Shahi;\
      2009, the GIMP Documentation Team"        ;copyright notice
    "May 02, 2018"                          	;date created
    ""                     						;image type that the script works on
    ;SF-STRING      "Text"          "Text Box"   ;a string variable
    ;SF-FONT        "Font"          "Charter"    ;a font variable
    ;SF-ADJUSTMENT  "Font size"     '(50 1 1000 1 10 0 1)
                                                ;a spin-button
    ;SF-COLOR       "Color"         '(0 0 0)     ;color variable
  )
  
(script-fu-menu-register "script-fu-beispiel" "<Image>/File/Create/Beispiel")