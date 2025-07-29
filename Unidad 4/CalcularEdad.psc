Funcion edadCliente ( fechaHoy, fechaColocada )
	anioHoyExtraida <- extraccionFecha (fechaHoy,7,10)
	anioColocadaExtraida <- extraccionFecha (fechaColocada,7,10)
	
	mesHoyExtraida <- extraccionFecha (fechaHoy,4,5)
	mesColocadaExtraida <- extraccionFecha (fechaColocada,4,5)
	
	diaHoyExtraida <- extraccionFecha (fechaHoy,1,2)
	diaColocadaExtraida <- extraccionFecha (fechaColocada,1,2)
	
	
	edadAnio = ConvertirANumero(anioHoyExtraida) - ConvertirANumero(anioColocadaExtraida)
	edadMeses= ConvertirANumero(mesHoyExtraida) - ConvertirANumero(mesColocadaExtraida)
	edadDias= ConvertirANumero(diaHoyExtraida) - ConvertirANumero(diaColocadaExtraida)
	
	Si edadDias < 0 Entonces
		edadDias <- edadDias+ 30
		edadMeses <- edadMeses - 1
	Fin Si
	
	Si edadMeses < 0 Entonces
		edadMeses <- edadMeses + 12
		edadAnio <- edadAnio - 1
	Fin Si
	
	Escribir "El cliente tiene " edadAnio, " anios ", edadMeses, " meses ", edadDias, " dias."
	
Fin Funcion

Funcion esFecha <- validarFechaAgregada(dia,mes,anio, anioActual)
	Definir esDia, esMes, esAnio, esFecha Como Logico
	
	Segun mes Hacer
		"01","03", "05","07","08","10","12":
			esMes <- Verdadero
			Segun dia Hacer
				"01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31":
					esDia <- Verdadero
				De Otro Modo:
					esDia <- Falso
			Fin Segun
		"02":
			esMes <- Verdadero
			Segun dia Hacer
				"01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28":
					esDia <- Verdadero
				De Otro Modo:
					esDia <- Falso
			Fin Segun
			
		"04","06","09","11":
			esMes <- Verdadero
			Segun dia Hacer
				"01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30":
					esDia <- Verdadero
				De Otro Modo:
					esDia <- Falso
			Fin Segun	
	Fin Segun
	
	
	Si ConvertirANumero(anio) > 1900 Y ConvertirANumero(anio) < ConvertirANumero(anioActual) Entonces
		esAnio <- Verdadero
	SiNo
		esAnio <- Falso
	Fin Si
	
	Si esDia Y esMes Y esAnio Entonces
		esFecha <- Verdadero
	SiNo
		esFecha <- Falso
	Fin Si
	
Fin Funcion

Funcion valorRegistrado <- ingresoValores ( )
	
	Definir esNumero Como Logico
	
	Escribir "Ingresa la fecha de nacimiento del cliente (dd-mm-aaaa):"
	Leer valorRegistrado
Fin Funcion

Funcion  fecha<- fechaActual ( )
	Definir fecha, dia, mes, anio como cadena
	fecha <- "22-07-2025"
Fin Funcion


Funcion fechaExtraida <- extraccionFecha (fecha,long1, long2)
	Definir fechaComoCadena Como Caracter
    Definir anioComoCadena Como Caracter
    Definir anioComoNumero Como Entero
	
    fechaExtraida <- SubCadena(fecha, long1, long2)    
Fin Funcion

Funcion  fecha<- fechaAgregada (fechaHoy)
	Definir fecha como cadena
	Definir esFechaValida Como Logico
	
	fechaColocada <- ingresoValores ( )
	anioColocadaExtraida <- extraccionFecha (fechaColocada,7,10)
	mesColocadaExtraida <- extraccionFecha (fechaColocada,4,5)
	diaColocadaExtraida <- extraccionFecha (fechaColocada,1,2)
	anioExtraida <- extraccionFecha (fechaHoy,7,10)
	esFechaValida <- validarFechaAgregada(diaColocadaExtraida,mesColocadaExtraida,anioColocadaExtraida, anioExtraida)
	Si esFechaValida Entonces
		fecha <- fechaColocada
	SiNo
		fecha <- "Fecha mal formada"
	Fin Si
Fin Funcion

Proceso CalcularEdad
	Definir fechaHoy Como Cadena
	Definir fechaColocada Como Cadena
	fechaHoy <- fechaActual()
	fechaColocada <- fechaAgregada(fechaHoy)
	Si fechaColocada =="Fecha mal formada" Entonces
		Escribir fechaColocada
	SiNo
		edadCliente( fechaHoy, fechaColocada )
	Fin Si
	
FinProceso