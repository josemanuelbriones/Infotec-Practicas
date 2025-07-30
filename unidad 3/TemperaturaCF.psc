// Funci�n para convertir una temperatura de grados Celsius a Fahrenheit y mostrarla.
Funcion  operacion ( temperatura)
	temp = ConvertirANumero(temperatura) // Convierte la temperatura de texto a un n�mero.
	
	// Muestra la temperatura original en Celsius que el usuario ingres�.
	Escribir "Temperatura colocada de grados celsius: ", temperatura 
	// Realiza el c�lculo para convertir Celsius a Fahrenheit usando la f�rmula: (C * 9/5) + 32.
	op <- (temp * 9/5) +32
	
	// Muestra la temperatura convertida en grados Fahrenheit.
	Escribir "Temperatura a grados fahrenheit: ", op
Fin Funcion

// Funci�n para validar si una cadena de texto representa un n�mero v�lido.
Funcion esNumero <- revisarNumero ( valorEscrito )
	Definir valorE Como Real
	valorE <- Longitud(valorEscrito) // Almacena la longitud total de la cadena.
	esNumero <- Verdadero // Se asume que la cadena es un n�mero hasta que se encuentre una inconsistencia.
	contador <- 0 // Contador para rastrear la cantidad de puntos decimales.
	
	// Itera a trav�s de cada car�cter de la cadena de entrada.
	Para i <- 1 Hasta valorE Hacer
		valorRevisar <- Subcadena(valorEscrito, i, i)
		Segun valorRevisar Hacer
			"0","1","2","3","4","5","6","7","8","9": // Si el car�cter es un d�gito (0-9), es v�lido. No se requiere ninguna acci�n.
				
			".": // Si el car�cter es un punto decimal.
				contador <- contador+1 // Incrementa el contador de puntos.
				Si contador > 1  Entonces // Si ya se ha encontrado un punto previamente, la cadena no es un n�mero v�lido
					esNumero <- falso
				Fin Si
			"-": // Si el car�cter es un guion.
				Si Subcadena(valorEscrito, 1, 1) = "-" Entonces // Valida si el guion est� al principio de la cadena
					esNumero <- Verdadero 
				SiNo
					esNumero <- Falso
				Fin Si
			De Otro Modo: // Si el car�cter no es un d�gito, un punto o un guion inicial.
				esNumero <- Falso
		Fin Segun
	FinPara
Fin Funcion

// Funci�n para solicitar una temperatura al usuario y asegurar que la entrada sea num�rica y v�lida.
Funcion valorRegistrado <- ingresoValores ( )
	
	Definir esNumero Como Logico // Variable para almacenar el resultado de la validaci�n.
	
	// Inicia un ciclo que se repite hasta que 'esNumero' sea Verdadero.
	Repetir
		Escribir "Ingresa temperartura" // Pide al usuario que ingrese la temperatura.
		Leer valorEscrito// Lee la entrada del usuario.
		esNumero <- revisarNumero(valorEscrito) // Llama a 'revisarNumero' para verificar si la entrada es un n�mero v�lido.
	Hasta Que esNumero == Verdadero // El ciclo contin�a mientras la entrada no sea un n�mero.
	
	valorRegistrado <- valorEscrito // Cuando se obtiene un valor num�rico v�lido, se asigna a 'valorRegistrado' y se retorna.
	
Fin Funcion

// Proceso principal para convertir temperatura de Celsius a Fahrenheit.
Proceso TemperaturaCF
	temperatura<- ingresoValores() // Solicita al usuario que ingrese la temperatura.
	operacion(temperatura) // Se llama la funci�n para realizar la conversi�n y mostrar el resultado. Se manda la temperatura.
FinProceso
	