;;****************
;;* FUNCIONES *
;;****************

(deffunction ask-question (?question $?allowed-values)
   (printout t ?question)
   (bind ?answer (read))
   (if (lexemep ?answer) 
       then (bind ?answer (lowcase ?answer)))
   (while (not (member ?answer ?allowed-values)) do
      (printout t ?question)
      (bind ?answer (read))
      (if (lexemep ?answer) 
          then (bind ?answer (lowcase ?answer))))
   ?answer)

(deffunction yes-or-no-p (?question)
   (bind ?response (ask-question ?question yes no y n))
   (if (or (eq ?response yes) (eq ?response y))
       then TRUE 
       else FALSE))

;;;************************************************************************
;;;DECLARACION DE REGLAS DE INGRESO DE COLORES Y CONTINUACION DEL PROGRAMA
;;;************************************************************************


(defrule system-banner ""
  (declare (salience 10))
  =>
  (printout t crlf crlf)
  (printout t "*********************************************************")
  (printout t crlf)
  (printout t "                 Compra de carros")
  (printout t crlf)
  (printout t "*********************************************************")
  (printout t crlf crlf))


(defrule MAIN::X1
   =>
   (bind ?response 
      (ask-question "Deseas comprar un carro (yes/no)? "
                    yes no))
   (if (eq ?response yes) 
       then 
      (printout t crlf)
      (assert(pase))
       else (if (eq ?response no)
                then
                (printout t crlf) 
    (assert(salir)))))


(defrule MAIN::X2
  (salir)
   => 
   (printout t "Gracias por su tiempo Adios!!")
   (printout t crlf)
   (printout t crlf)
   (exit))


(defrule MAIN::X3
  (comprar)
   =>
   (bind ?response 
      (ask-question "Seleccione una marca (mazda/renault/kia)?" 
        mazda renault kia)) 
    (if (eq ?response mazda) 
       then 
      (assert (mazda))
       else (if (eq ?response kia)
                then 
    (assert (kia))
    else (if (eq ?response renault)
    then
    (assert(renault))))))


(defrule MAIN::X4
  (mazda)
   =>
   (printout t "Gracias por preferir Mazda")
   (printout t crlf)
   (printout t crlf)
   (assert(color)))

(defrule MAIN::X5
  (kia)
   =>
   (printout t "Gracias por preferir Kia")
   (printout t crlf)
   (printout t crlf)
   (assert(color)))

(defrule MAIN::X6
  (renault)
   =>
   (printout t "Gracias por preferir Renault")
   (printout t crlf)
   (printout t crlf)
   (assert(color)))

(defrule MAIN::X7
  (color)
   =>
   (bind ?response 
      (ask-question "Seleccione un color (amarillo/azul/rojo)?" 
        amarillo azul rojo)) 
    (if (eq ?response amarillo) 
       then
      (printout t "De color amarillo")
      (printout t crlf)
      (printout t crlf)
      (assert(puerta))
       else (if (eq ?response azul)
                then 
      (printout t "De color azul")
      (printout t crlf)
      (printout t crlf)
    (assert(puerta))
    else (if (eq ?response rojo)
    then
    (printout t "De color rojo")
      (printout t crlf)
      (printout t crlf)
    (assert(puerta))))))

(defrule MAIN::X8
  (puerta)
   =>
   (bind ?response 
      (ask-question "Seleccione cuantas puertas (2/4)?" 
        2 4)) 
    (if (eq ?response 2) 
       then 
       (printout t "De 2 puertas")
      (printout t crlf)
      (printout t crlf)
      (assert(pago))
       else (if (eq ?response 4)
                then 
      (printout t "De 4 puertas")
      (printout t crlf)
      (printout t crlf)
    (assert(pago)))))


(defrule MAIN::X9
  (venta)
   =>
   (printout t "Felicidades por tu nuevo carro")
   (assert(exit)))

(defrule MAIN::X10
  (pase)
   =>
   (bind ?response 
      (ask-question "Tienes pase (yes/no)? "
                    yes no))
   (if (eq ?response yes) 
       then 
      (printout t crlf)
      (printout t crlf)
      (assert(modelo))
       else (if (eq ?response no)
                then 
      (printout t "Es necesario tener el pase para poder adquirir el carro")
      (printout t crlf)
      (printout t crlf)
    (assert (salir)))))

(defrule MAIN::X11
  (modelo)
   =>
   (bind ?response 
      (ask-question "Seleccione el modelo (2019/2018/2017)? "
                    2019 2018 2017))
   (if (eq ?response 2019) 
       then 
      (printout t "Modelo 2019")
      (printout t crlf)
      (printout t crlf)
      (assert(comprar))
       else (if (eq ?response 2018)
                then 
      (printout t "Modelo 2018")
      (printout t crlf)
      (printout t crlf)
    (assert (comprar))
    else (if (eq ?response 2017)
                then 
      (printout t "Modelo 2017")
      (printout t "Modelo 2018")
      (printout t crlf)
      (printout t crlf)
      (assert(comprar))))))

(defrule MAIN::X12
  (pago)
   =>
   (bind ?response 
      (ask-question "En efectivo o tarjeta (efectivo/tarjeta)?"
                    efectivo tarjeta))
   (if (eq ?response efectivo) 
       then
      (printout t "En efectivo")
      (printout t crlf)
      (printout t crlf) 
      (assert(venta))
       else (if (eq ?response tarjeta)
                then 
      (printout t "Por tarjeta de credito")
      (printout t crlf)
      (printout t crlf)
    (assert (banco)))))

(defrule MAIN::X13
  (tarjeta)
   =>
   (bind ?response 
      (ask-question "Mastercard o Visa (mastercard/visa)?"
                    mastercard visa))
   (if (eq ?response mastercard) 
       then
      (printout t "Tengo mastercard")
      (printout t crlf)
      (printout t crlf) 
      (assert(validar))
       else (if (eq ?response visa)
                then 
      (printout t "Tengo Visa")
      (printout t crlf)
      (printout t crlf)
    (assert (validar)))))

(defrule MAIN::X14
  (banco)
   =>
   (bind ?response 
      (ask-question "Banco (bbva/bancolombia)?"
                    bbva bancolombia))
   (if (eq ?response bbva) 
       then
      (printout t "En el banco bbva")
      (printout t crlf)
      (printout t crlf) 
      (assert(tarjeta))
       else (if (eq ?response bancolombia)
                then 
      (printout t "En el banco bancolombia")
      (printout t crlf)
      (printout t crlf)
    (assert (tarjeta)))))


(defrule MAIN::X15
  (validar)
   =>
   (bind ?response 
      (ask-question "Esta seguor de pagar el monto (yes/no)?"
                    yes no))
   (if (eq ?response yes) 
       then 
      (assert(venta))
       else (if (eq ?response no)
                then 
      (printout t "No pagaste por la compra")
      (printout t crlf)
      (printout t crlf)
    (assert (salir)))))


