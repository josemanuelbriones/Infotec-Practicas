// Funci�n para calcular y mostrar la edad del cliente.
Funcion edadCliente ( fechaHoy, fechaColocada )
	// Extrae el a�o de ambas fechas.
	anioHoyExtraida <- extraccionFecha (fechaHoy,7,10)
	anioColocadaExtraida <- extraccionFecha (fechaColocada,7,10)
	
	// Extrae el mes de ambas fechas.
	mesHoyExtraida <- extraccionFecha (fechaHoy,4,5)
	mesColocadaExtraida <- extraccionFecha (fechaColocada,4,5)
	
	// Extrae el d�a de ambas fechas.
	diaHoyExtraida <- extraccionFecha (fechaHoy,1,2)
	diaColocadaExtraida <- extraccionFecha (fechaColocada,1,2)
	
	// Calcula la diferencia inicial de a�os, meses y d�as.
	edadAnio = ConvertirANumero(anioHoyExtraida) - ConvertirANumero(anioColocadaExtraida)
	edadMeses= ConvertirANumero(mesHoyExtraida) - ConvertirANumero(mesColocadaExtraida)
	edadDias= ConvertirANumero(diaHoyExtraida) - ConvertirANumero(diaColocadaExtraida)
	
	// Ajusta los d�as si la diferencia es negativa.
	Si edadDias < 0 Entonces
		edadDias <- edadDias+ 30
		edadMeses <- edadMeses - 1 // Resta un mes si se tomaron d�as del mes anterior.
	Fin Si
	// Ajusta los meses si la diferencia es negativa.
	Si edadMeses < 0 Entonces
		edadMeses <- edadMeses + 12
		edadAnio <- edadAnio - 1 // Resta un a�o si se tomaron meses del a�o anterior.
	Fin Si
	// Muestra la edad calculada del cliente.
	Escribir "El cliente tiene " edadAnio, " anios ", edadMeses, " meses ", edadDias, " dias."
	
Fin Funcion

// Funci�n para validar si una fecha es coherente
Funcion esFecha <- validarFechaAgregada(dia,mes,anio, anioActual)
	// Declara variables l�gicas para validar cada componente de la fecha.
	Definir esDia, esMes, esAnio, esFecha Como Logico
	// Eval�a el mes para determinar los d�as v�lidos.
	Segun mes Hacer
		// Meses con 31 d�as.
		"01","03", "05","07","08","10","12":
			esMes <- Verdadero // El mes es v�lido.
			// Valida el d�a para meses de 31 d�as.
			Segun dia Hacer
				"01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31":
					esDia <- Verdadero // El d�a es v�lido.
				De Otro Modo:
					esDia <- Falso // El d�a no es v�lido.
			Fin Segun
		// Febrero (
		"02":
			esMes <- Verdadero // El mes es v�lido.
			// Valida el d�a para febrero
			Segun dia Hacer
				"01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28":
					esDia <- Verdadero // El d�a es v�lido.
				De Otro Modo:
					esDia <- Falso // El d�a no es v�lido.
			Fin Segun
		// Meses con 30 d�as.
		"04","06","09","11":
			esMes <- Verdadero // El mes es v�lido.
			// Valida el d�a para meses de 30 d�as.
			Segun dia Hacer 
				"01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30":
					esDia <- Verdadero // El d�a es v�lido.
				De Otro Modo:
					esDia <- Falso // El d�a no es v�lido.
			Fin Segun
		// En cualquier otro caso, el mes no es v�lido
		De Otro Modo:
			esMes <- Falso
			esDia <- Falso // Si el mes no es v�lido, el d�a tampoco.
	Fin Segun
	
	// Valida el a�o: debe ser mayor a 1900 y menor que el a�o actual.
	Si ConvertirANumero(anio) > 1900 Y ConvertirANumero(anio) < ConvertirANumero(anioActual) Entonces
		esAnio <- Verdadero // El a�o es v�lido.
	SiNo
		esAnio <- Falso // El a�o no es v�lido.
	Fin Si
	// Determina si la fecha completa es v�lida
	Si esDia Y esMes Y esAnio Entonces
		esFecha <- Verdadero
	SiNo
		esFecha <- Falso
	Fin Si
Fin Funcion

// Funci�n para solicitar al usuario que ingrese una fecha.
Funcion valorRegistrado <- ingresoValores ( )
	
	Definir esNumero Como Logico
	// Pide al usuario que ingrese la fecha de nacimiento.
	Escribir "Ingresa la fecha de nacimiento del cliente (dd-mm-aaaa):"
	// Lee la entrada del usuario y la almacena en 'valorRegistrado'.
	Leer valorRegistrado
Fin Funcion

Funcion  fecha<- fechaActual ( )
	// Asigna una fecha fija a la variable 'fecha'.
	Definir fecha como cadena
	fecha <- "22-07-2025"
Fin Funcion

// Funci�n para extraer una subcadena de una fecha
Funcion fechaExtraida <- extraccionFecha (fecha,long1, long2)
	// Declara variables como tipo Caracter
	Definir fechaComoCadena Como Caracter
    Definir anioComoCadena Como Caracter
	// Declara 'anioComoNumero' como Entero
    Definir anioComoNumero Como Entero
	// Extrae la parte de la fecha especificada por 'long1' y 'long2'.
    fechaExtraida <- SubCadena(fecha, long1, long2)    
Fin Funcion

// Funci�n para obtener y validar la fecha de nacimiento ingresada por el usuario.
Funcion  fecha<- fechaAgregada (fechaHoy)
	// Declara 'fecha' como cadena para el resultado y 'esFechaValida' como L�gico.
	Definir fecha como cadena
	Definir esFechaValida Como Logico
	
	// Solicita la fecha de nacimiento al usuario.
	fechaColocada <- ingresoValores ( )
	// Extrae las partes de la fecha ingresada.
	anioColocadaExtraida <- extraccionFecha (fechaColocada,7,10)
	mesColocadaExtraida <- extraccionFecha (fechaColocada,4,5)
	diaColocadaExtraida <- extraccionFecha (fechaColocada,1,2)
	// Extrae el a�o de la fecha actual para la validaci�n del a�o de nacimiento.
	anioExtraida <- extraccionFecha (fechaHoy,7,10) 
	// Llama a la funci�n de validaci�n para verificar la fecha ingresada.
	esFechaValida <- validarFechaAgregada(diaColocadaExtraida,mesColocadaExtraida,anioColocadaExtraida, anioExtraida)
	// Si la fecha es v�lida, la asigna al retorno de la funci�n.
	Si esFechaValida Entonces
		fecha <- fechaColocada
	SiNo
		fecha <- "Fecha mal formada"
	Fin Si
Fin Funcion

// Proceso principal
Proceso CalcularEdad
	// Declara variables para la fecha actual y la fecha ingresada por el usuario.
	Definir fechaHoy Como Cadena
	Definir fechaColocada Como Cadena
	
	// Obtiene la fecha actual (fija en "22-07-2025" seg�n la funci�n fechaActual).
	fechaHoy <- fechaActual()
	// Obtiene y valida la fecha de nacimiento ingresada por el usuario.
	fechaColocada <- fechaAgregada(fechaHoy)
	// Verifica si la fecha ingresada fue "Fecha mal formada".
	Si fechaColocada =="Fecha mal formada" Entonces
		// Si la fecha es inv�lida, imprime el mensaje de error.
		Escribir fechaColocada
	SiNo
		// Si la fecha es v�lida, calcula y muestra la edad del cliente.
		edadCliente( fechaHoy, fechaColocada )
	Fin Si
	
FinProceso