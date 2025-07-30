// Función para calcular y mostrar la edad del cliente.
Funcion edadCliente ( fechaHoy, fechaColocada )
	// Extrae el año de ambas fechas.
	anioHoyExtraida <- extraccionFecha (fechaHoy,7,10)
	anioColocadaExtraida <- extraccionFecha (fechaColocada,7,10)
	
	// Extrae el mes de ambas fechas.
	mesHoyExtraida <- extraccionFecha (fechaHoy,4,5)
	mesColocadaExtraida <- extraccionFecha (fechaColocada,4,5)
	
	// Extrae el día de ambas fechas.
	diaHoyExtraida <- extraccionFecha (fechaHoy,1,2)
	diaColocadaExtraida <- extraccionFecha (fechaColocada,1,2)
	
	// Calcula la diferencia inicial de años, meses y días.
	edadAnio = ConvertirANumero(anioHoyExtraida) - ConvertirANumero(anioColocadaExtraida)
	edadMeses= ConvertirANumero(mesHoyExtraida) - ConvertirANumero(mesColocadaExtraida)
	edadDias= ConvertirANumero(diaHoyExtraida) - ConvertirANumero(diaColocadaExtraida)
	
	// Ajusta los días si la diferencia es negativa.
	Si edadDias < 0 Entonces
		edadDias <- edadDias+ 30
		edadMeses <- edadMeses - 1 // Resta un mes si se tomaron días del mes anterior.
	Fin Si
	// Ajusta los meses si la diferencia es negativa.
	Si edadMeses < 0 Entonces
		edadMeses <- edadMeses + 12
		edadAnio <- edadAnio - 1 // Resta un año si se tomaron meses del año anterior.
	Fin Si
	// Muestra la edad calculada del cliente.
	Escribir "El cliente tiene " edadAnio, " anios ", edadMeses, " meses ", edadDias, " dias."
	
Fin Funcion

// Función para validar si una fecha es coherente
Funcion esFecha <- validarFechaAgregada(dia,mes,anio, anioActual)
	// Declara variables lógicas para validar cada componente de la fecha.
	Definir esDia, esMes, esAnio, esFecha Como Logico
	// Evalúa el mes para determinar los días válidos.
	Segun mes Hacer
		// Meses con 31 días.
		"01","03", "05","07","08","10","12":
			esMes <- Verdadero // El mes es válido.
			// Valida el día para meses de 31 días.
			Segun dia Hacer
				"01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31":
					esDia <- Verdadero // El día es válido.
				De Otro Modo:
					esDia <- Falso // El día no es válido.
			Fin Segun
		// Febrero (
		"02":
			esMes <- Verdadero // El mes es válido.
			// Valida el día para febrero
			Segun dia Hacer
				"01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28":
					esDia <- Verdadero // El día es válido.
				De Otro Modo:
					esDia <- Falso // El día no es válido.
			Fin Segun
		// Meses con 30 días.
		"04","06","09","11":
			esMes <- Verdadero // El mes es válido.
			// Valida el día para meses de 30 días.
			Segun dia Hacer 
				"01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30":
					esDia <- Verdadero // El día es válido.
				De Otro Modo:
					esDia <- Falso // El día no es válido.
			Fin Segun
		// En cualquier otro caso, el mes no es válido
		De Otro Modo:
			esMes <- Falso
			esDia <- Falso // Si el mes no es válido, el día tampoco.
	Fin Segun
	
	// Valida el año: debe ser mayor a 1900 y menor que el año actual.
	Si ConvertirANumero(anio) > 1900 Y ConvertirANumero(anio) < ConvertirANumero(anioActual) Entonces
		esAnio <- Verdadero // El año es válido.
	SiNo
		esAnio <- Falso // El año no es válido.
	Fin Si
	// Determina si la fecha completa es válida
	Si esDia Y esMes Y esAnio Entonces
		esFecha <- Verdadero
	SiNo
		esFecha <- Falso
	Fin Si
Fin Funcion

// Función para solicitar al usuario que ingrese una fecha.
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

// Función para extraer una subcadena de una fecha
Funcion fechaExtraida <- extraccionFecha (fecha,long1, long2)
	// Declara variables como tipo Caracter
	Definir fechaComoCadena Como Caracter
    Definir anioComoCadena Como Caracter
	// Declara 'anioComoNumero' como Entero
    Definir anioComoNumero Como Entero
	// Extrae la parte de la fecha especificada por 'long1' y 'long2'.
    fechaExtraida <- SubCadena(fecha, long1, long2)    
Fin Funcion

// Función para obtener y validar la fecha de nacimiento ingresada por el usuario.
Funcion  fecha<- fechaAgregada (fechaHoy)
	// Declara 'fecha' como cadena para el resultado y 'esFechaValida' como Lógico.
	Definir fecha como cadena
	Definir esFechaValida Como Logico
	
	// Solicita la fecha de nacimiento al usuario.
	fechaColocada <- ingresoValores ( )
	// Extrae las partes de la fecha ingresada.
	anioColocadaExtraida <- extraccionFecha (fechaColocada,7,10)
	mesColocadaExtraida <- extraccionFecha (fechaColocada,4,5)
	diaColocadaExtraida <- extraccionFecha (fechaColocada,1,2)
	// Extrae el año de la fecha actual para la validación del año de nacimiento.
	anioExtraida <- extraccionFecha (fechaHoy,7,10) 
	// Llama a la función de validación para verificar la fecha ingresada.
	esFechaValida <- validarFechaAgregada(diaColocadaExtraida,mesColocadaExtraida,anioColocadaExtraida, anioExtraida)
	// Si la fecha es válida, la asigna al retorno de la función.
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
	
	// Obtiene la fecha actual (fija en "22-07-2025" según la función fechaActual).
	fechaHoy <- fechaActual()
	// Obtiene y valida la fecha de nacimiento ingresada por el usuario.
	fechaColocada <- fechaAgregada(fechaHoy)
	// Verifica si la fecha ingresada fue "Fecha mal formada".
	Si fechaColocada =="Fecha mal formada" Entonces
		// Si la fecha es inválida, imprime el mensaje de error.
		Escribir fechaColocada
	SiNo
		// Si la fecha es válida, calcula y muestra la edad del cliente.
		edadCliente( fechaHoy, fechaColocada )
	Fin Si
	
FinProceso