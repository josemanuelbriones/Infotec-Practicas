// Función para convertir una temperatura de grados Celsius a Fahrenheit y mostrarla.
Funcion  operacion ( temperatura)
	temp = ConvertirANumero(temperatura) // Convierte la temperatura de texto a un número.
	
	// Muestra la temperatura original en Celsius que el usuario ingresó.
	Escribir "Temperatura colocada de grados celsius: ", temperatura 
	// Realiza el cálculo para convertir Celsius a Fahrenheit usando la fórmula: (C * 9/5) + 32.
	op <- (temp * 9/5) +32
	
	// Muestra la temperatura convertida en grados Fahrenheit.
	Escribir "Temperatura a grados fahrenheit: ", op
Fin Funcion

// Función para validar si una cadena de texto representa un número válido.
Funcion esNumero <- revisarNumero ( valorEscrito )
	Definir valorE Como Real
	valorE <- Longitud(valorEscrito) // Almacena la longitud total de la cadena.
	esNumero <- Verdadero // Se asume que la cadena es un número hasta que se encuentre una inconsistencia.
	contador <- 0 // Contador para rastrear la cantidad de puntos decimales.
	
	// Itera a través de cada carácter de la cadena de entrada.
	Para i <- 1 Hasta valorE Hacer
		valorRevisar <- Subcadena(valorEscrito, i, i)
		Segun valorRevisar Hacer
			"0","1","2","3","4","5","6","7","8","9": // Si el carácter es un dígito (0-9), es válido. No se requiere ninguna acción.
				
			".": // Si el carácter es un punto decimal.
				contador <- contador+1 // Incrementa el contador de puntos.
				Si contador > 1  Entonces // Si ya se ha encontrado un punto previamente, la cadena no es un número válido
					esNumero <- falso
				Fin Si
			"-": // Si el carácter es un guion.
				Si Subcadena(valorEscrito, 1, 1) = "-" Entonces // Valida si el guion está al principio de la cadena
					esNumero <- Verdadero 
				SiNo
					esNumero <- Falso
				Fin Si
			De Otro Modo: // Si el carácter no es un dígito, un punto o un guion inicial.
				esNumero <- Falso
		Fin Segun
	FinPara
Fin Funcion

// Función para solicitar una temperatura al usuario y asegurar que la entrada sea numérica y válida.
Funcion valorRegistrado <- ingresoValores ( )
	
	Definir esNumero Como Logico // Variable para almacenar el resultado de la validación.
	
	// Inicia un ciclo que se repite hasta que 'esNumero' sea Verdadero.
	Repetir
		Escribir "Ingresa temperartura" // Pide al usuario que ingrese la temperatura.
		Leer valorEscrito// Lee la entrada del usuario.
		esNumero <- revisarNumero(valorEscrito) // Llama a 'revisarNumero' para verificar si la entrada es un número válido.
	Hasta Que esNumero == Verdadero // El ciclo continúa mientras la entrada no sea un número.
	
	valorRegistrado <- valorEscrito // Cuando se obtiene un valor numérico válido, se asigna a 'valorRegistrado' y se retorna.
	
Fin Funcion

// Proceso principal para convertir temperatura de Celsius a Fahrenheit.
Proceso TemperaturaCF
	temperatura<- ingresoValores() // Solicita al usuario que ingrese la temperatura.
	operacion(temperatura) // Se llama la función para realizar la conversión y mostrar el resultado. Se manda la temperatura.
FinProceso
	