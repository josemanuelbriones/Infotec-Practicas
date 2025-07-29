// Funci�n para realizar la operaci�n de c�lculo del �rea de un tri�ngulo y mostrar el resultado.
Funcion  operacion ( base, altura )
	
	b<-ConvertirANumero(base) // Convierte el valor de la base de texto a n�mero.
	a<-ConvertirANumero(altura)// Convierte el valor de la altura de texto a n�mero.
	Escribir "Base: ",base // Muestra la base ingresada por el usuario.
	Escribir "Altura: ",altura // Muestra la altura ingresada por el usuario.
	Escribir "Area del triangulo: ", (b*a)/2 // Calcula el �rea del tri�ngulo usando la f�rmula (base * altura) / 2 y la muestra.
Fin Funcion


// Funci�n para verificar si una cadena de texto representa un n�mero v�lido.
Funcion esNumero <- revisarNumero ( valorEscrito )
	Definir valorE Como Real // Variable para almacenar la longitud del valor escrito
	valorE <- Longitud(valorEscrito)
	
	esNumero <- Verdadero // Asume que la cadena es un n�mero hasta que se demuestre lo contrario.
	contador <- 0 // Contador para llevar el control de los puntos decimales.
	
	// Itera sobre cada car�cter de la cadena de texto.
	Para i <- 1 Hasta valorE Hacer // El ciclo recorre cada car�cter de la cadena.
		valorRevisar <- Subcadena(valorEscrito, i, i) // Extrae un solo car�cter en la posici�n actual 'i'.
		
		// Eval�a el car�cter extra�do.
		Segun valorRevisar Hacer
			"0","1","2","3","4","5","6","7","8","9": // Si el car�cter es un d�gito del 0 al 9, no hace nada.

			".": // Si el car�cter es un punto decimal.
				contador <- contador+1 // Incrementa el contador de puntos.
				Si contador > 1  Entonces // Si ya se encontr� un punto anteriormente, significa que hay m�s de uno.
					esNumero <- falso // La cadena no es un n�mero v�lido.
				Fin Si
			De Otro Modo: // Si el car�cter no es un d�gito ni un punto.
				esNumero <- Falso // La cadena no es un n�mero.
		Fin Segun
	FinPara
Fin Funcion



// Funci�n para solicitar un valor al usuario y asegurar que sea un n�mero v�lido.
// Se repite la solicitud hasta que el usuario ingrese un n�mero correcto.
Funcion valorRegistrado <- ingresoValores ( valorPedir )
	
	Definir esNumero Como Logico // Variable para almacenar el resultado de la validaci�n num�rica.
	
	// Ciclo que se repite hasta que el valor ingresado sea un n�mero.
	Repetir
		// Pide al usuario que ingrese el valor especificado:"base" o "altura".
		Escribir "Ingresa ", valorPedir
		Leer valorEscrito // Lee la entrada del usuario
		// Llama a la funci�n revisarNumero para validar la entrada.
		esNumero <- revisarNumero(valorEscrito)
	Hasta Que esNumero == Verdadero // Contin�a el ciclo mientras la entrada no sea un n�mero v�lido.
	// Una vez que se ingresa un valor num�rico v�lido, se asigna a 'valorRegistrado' y se retorna.
	valorRegistrado <- valorEscrito
Fin Funcion

//Proceso Principal
Proceso AreaTrinangulo
	// Solicita al usuario la base del tri�ngulo
	base<- ingresoValores("base")
	// Solicita al usuario la altura del tri�ngulo
	altura <- ingresoValores("altura")
	// Llama a la funci�n 'operacion' para realizar el c�lculo del �rea y mostrar el resultado.
	operacion(base,altura)
FinProceso

