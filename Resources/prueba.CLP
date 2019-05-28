(defrule MAIN::R1
	(llenar la solicitud) 
	=>
	(printout t "Pedir aprobacion" crlf)
	(printout t "Llevar los papeles para el tramite" crlf))
(defrule MAIN::R2
	(llenar la solicitud)(evaluar solicitud)(carta de preaprobacion) 
	=>
	(printout t "Evaluar la propiedad" crlf))
(defrule MAIN::R3
	(llernar la solicitud)(evaluar solicitud)(carta de preaprobacion)(solicitud aprobada)
	=>
	(printout t "liquidacion de prestamo" crlf))
(defrule MAIN::R4
	(evaluar solicitud)
	=>
	(printout t "Debe llenar la solicitud" crlf))
(defrule MAIN::R5
	(carta de preaprobacion)
	=>
	(printout t "Debe llenar la solicitud" crlf))
(defrule MAIN::R6
	(solicitud aprobada)
	=>
	(printout t "Debe llenar la solicitud" crlf))
