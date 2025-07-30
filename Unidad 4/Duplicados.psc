// Funci�n para verificar si una cadena de texto representa un n�mero v�lido.
Funcion esNumero <- revisarNumero ( valorEscrito )
	Definir valorE Como Entero // Variable para almacenar la longitud del valor escrito
	valorE <- Longitud(valorEscrito)
	
	esNumero <- Verdadero // Asume que la cadena es un n�mero hasta que se demuestre lo contrario.
	contador <- 0// Contador para llevar el control de los puntos decimales.
	
	// Itera sobre cada car�cter de la cadena de texto.
	Para i <- 1 Hasta valorE Hacer // El ciclo recorre cada car�cter de la cadena.
		valorRevisar <- Subcadena(valorEscrito, i, i) // Extrae un solo car�cter en la posici�n actual 'i'.
		
		// Eval�a el car�cter extra�do.
		Segun valorRevisar Hacer
			"0","1","2","3","4","5","6","7","8","9": // Si el car�cter es un d�gito del 0 al 9, no hace nada.
			De Otro Modo: // Si el car�cter no es un d�gito ni un punto.
				esNumero <- Falso // La cadena no es un n�mero.
		Fin Segun
	FinPara
Fin Funcion

// Funci�n para solicitar un valor al usuario y asegurar que sea un n�mero v�lido.
Funcion valorEscrito <- ingresoValor ( pregunta )
	
	Repetir
		Escribir pregunta // Muestra la pregunta al usuario.
		Leer valorEscrito // Lee la entrada del usuario.
		esNumero <- revisarNumero( valorEscrito ) // Llama a 'revisarNumero' para validar la entrada.
		
	Hasta Que esNumero = Verdadero // Repite el ciclo hasta que la entrada sea un n�mero v�lido.
Fin Funcion


// Proceso principal
Proceso Duplicados
	Escribir "Busqueda de numeros duplicados exactamente dos veces"
	Definir tamanoArreglo como entero
	// Solicita al usuario el tama�o del arreglo utilizando
	tamanoArreglo <- ConvertirANumero(ingresoValor( "Ingresa el tamano del arreglo" ))
	Dimension arregloNumeros[tamanoArreglo] // Declara el arreglo principal de n�meros con el tama�o especificado.
	// Llena el arreglo con n�meros ingresados por el usuario, validando cada entrada.
	Para a<-1 hasta tamanoArreglo con paso 1 Hacer
		arregloNumeros[a] <- ConvertirANumero(ingresoValor( "Ingresa el numero positivo"))
	FinPara
	// Declara un arreglo para almacenar los resultados finales (n�meros duplicados exactamente dos veces).
	Dimension resultadosFinales[100] 
	// Declara y inicializa el �ndice para controlar la cantidad de elementos en 'resultadosFinales'.
	Definir indiceResultadosFinales Como Entero
	indiceResultadosFinales <- 0 
	// Declara variables auxiliares para el procesamiento.
	Definir numeroActual Como Entero
	Definir contadorFrecuencia Como Entero
	Definir agregado Como Logico
	// Itera a trav�s de cada elemento del 'arregloNumeros'.
	Para i <- 0 Hasta tamanoArreglo - 1 Con Paso 1 Hacer
		numeroActual <- arregloNumeros[i+1] // Obtiene el n�mero actual a verificar
		contadorFrecuencia <- 0 // Reinicia el contador de frecuencia
		// Itera nuevamente sobre el 'arregloNumeros' para contar las ocurrencias de 'numeroActual'.
		Para j <- 0 Hasta tamanoArreglo - 1 Con Paso 1 Hacer
			Si arregloNumeros[j+1] = numeroActual Entonces // Si encuentra una coincidencia.
				contadorFrecuencia <- contadorFrecuencia + 1 // Incrementa el contador de frecuencia.
			FinSi
		FinPara
		// Si el n�mero actual aparece exactamente dos veces.
		Si contadorFrecuencia = 2 Entonces
			// Inicializa 'agregado' a Falso, asumiendo que el n�mero a�n no est� en 'resultadosFinales'.
			agregado <- Falso
			// Verifica si el 'numeroActual' ya fue a�adido a 'resultadosFinales' para evitar duplicados en la salida.
			Para k <- 0 Hasta indiceResultadosFinales - 1 Con Paso 1 Hacer
				Si resultadosFinales[k+1] = numeroActual Entonces
					// Si ya est�, marca como 'agregado' y sale del bucle interno.
					agregado <- Verdadero
					k <- indiceResultadosFinales 
				FinSi
			FinPara
			// Si el n�mero no ha sido agregado, lo a�ade a la lista de resultados.
			Si No agregado Entonces
				resultadosFinales[indiceResultadosFinales+1] <- numeroActual
				indiceResultadosFinales <- indiceResultadosFinales + 1
			FinSi
		FinSi
	FinPara
	
	// Muestra los resultados finales.
	Escribir "N�meros que se repiten exactamente 2 veces: "
	// Verifica si se encontraron n�meros duplicados.
	Si indiceResultadosFinales = 0 Entonces
		Escribir "[] (Ning�n n�mero se repite exactamente 2 veces)"
	Sino
		// Imprime los n�meros encontrados en formato de lista.
		Escribir "[" Sin Saltar
		Para i <- 0 Hasta indiceResultadosFinales - 1 Con Paso 1 Hacer
			Escribir resultadosFinales[i+1] Sin Saltar
			Si i < indiceResultadosFinales - 1 Entonces
				Escribir ","
			FinSi
		FinPara
		Escribir "]" Sin Saltar
	FinSi
	Escribir " "
FinProceso