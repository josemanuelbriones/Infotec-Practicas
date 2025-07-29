// Función para realizar la operación de cálculo del área de un triángulo y mostrar el resultado.
Funcion  operacion ( base, altura )
	
	b<-ConvertirANumero(base) // Convierte el valor de la base de texto a número.
	a<-ConvertirANumero(altura)// Convierte el valor de la altura de texto a número.
	Escribir "Base: ",base // Muestra la base ingresada por el usuario.
	Escribir "Altura: ",altura // Muestra la altura ingresada por el usuario.
	Escribir "Area del triangulo: ", (b*a)/2 // Calcula el área del triángulo usando la fórmula (base * altura) / 2 y la muestra.
Fin Funcion


// Función para verificar si una cadena de texto representa un número válido.
Funcion esNumero <- revisarNumero ( valorEscrito )
	Definir valorE Como Real // Variable para almacenar la longitud del valor escrito
	valorE <- Longitud(valorEscrito)
	
	esNumero <- Verdadero // Asume que la cadena es un número hasta que se demuestre lo contrario.
	contador <- 0 // Contador para llevar el control de los puntos decimales.
	
	// Itera sobre cada carácter de la cadena de texto.
	Para i <- 1 Hasta valorE Hacer // El ciclo recorre cada carácter de la cadena.
		valorRevisar <- Subcadena(valorEscrito, i, i) // Extrae un solo carácter en la posición actual 'i'.
		
		// Evalúa el carácter extraído.
		Segun valorRevisar Hacer
			"0","1","2","3","4","5","6","7","8","9": // Si el carácter es un dígito del 0 al 9, no hace nada.

			".": // Si el carácter es un punto decimal.
				contador <- contador+1 // Incrementa el contador de puntos.
				Si contador > 1  Entonces // Si ya se encontró un punto anteriormente, significa que hay más de uno.
					esNumero <- falso // La cadena no es un número válido.
				Fin Si
			De Otro Modo: // Si el carácter no es un dígito ni un punto.
				esNumero <- Falso // La cadena no es un número.
		Fin Segun
	FinPara
Fin Funcion



// Función para solicitar un valor al usuario y asegurar que sea un número válido.
// Se repite la solicitud hasta que el usuario ingrese un número correcto.
Funcion valorRegistrado <- ingresoValores ( valorPedir )
	
	Definir esNumero Como Logico // Variable para almacenar el resultado de la validación numérica.
	
	// Ciclo que se repite hasta que el valor ingresado sea un número.
	Repetir
		// Pide al usuario que ingrese el valor especificado:"base" o "altura".
		Escribir "Ingresa ", valorPedir
		Leer valorEscrito // Lee la entrada del usuario
		// Llama a la función revisarNumero para validar la entrada.
		esNumero <- revisarNumero(valorEscrito)
	Hasta Que esNumero == Verdadero // Continúa el ciclo mientras la entrada no sea un número válido.
	// Una vez que se ingresa un valor numérico válido, se asigna a 'valorRegistrado' y se retorna.
	valorRegistrado <- valorEscrito
Fin Funcion

//Proceso Principal
Proceso AreaTrinangulo
	// Solicita al usuario la base del triángulo
	base<- ingresoValores("base")
	// Solicita al usuario la altura del triángulo
	altura <- ingresoValores("altura")
	// Llama a la función 'operacion' para realizar el cálculo del área y mostrar el resultado.
	operacion(base,altura)
FinProceso

