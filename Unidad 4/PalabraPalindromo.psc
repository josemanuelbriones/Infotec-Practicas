// Funci�n para verificar si una palabra es un pal�ndromo.
Funcion validarPalabraPalindromo ( palabra )
	// Inicializa una cadena vac�a para construir la palabra invertida.
	palabraInversa <- ""
	Definir i, log Como Entero
	log <- Longitud(palabra) // Obtiene la longitud de la 'palabra' de entrada.
	
	// Itera desde el �ltimo car�cter de la palabra hasta el primero.
	Para i <- log Hasta 1 Con Paso -1 Hacer
		// Concatena cada car�cter, empezando por el �ltimo.
		palabraInversa <- palabraInversa + Subcadena(palabra,i,i)
	Fin Para
	// Compara la palabra original con su versi�n invertida.
	Si palabraInversa = palabra Entonces
		Escribir "Es un palindromo" // Si son iguales, la palabra es un pal�ndromo.
	SiNo
		Escribir "No es un palindromo" // Si no son iguales, la palabra no es un pal�ndromo.
	Fin Si
	
Fin Funcion

// Funci�n para verificar si una cadena de texto contiene solo letras
Funcion esValido <- revisarCadena ( valorEscrito )
	// Declara 'caracter' para almacenar cada car�cter de la cadena.
	Definir caracter como caracter
	Definir i, long como entero
	// Declara 'esValido' como una variable l�gica para el resultado de la validaci�n.
	Definir esValido como logico
	
	long <- Longitud(valorEscrito) // Obtiene la longitud de la cadena de entrada.
	esValido <- Verdadero // Inicialmente, asume que la cadena es v�lida
	
	// Itera sobre cada car�cter de la cadena.
	Para i <- 1 Hasta long Con Paso 1 Hacer
		caracter <- subcadena(valorEscrito, i, i) // Extrae el car�cter actual en la posici�n 'i'.
		// Comprueba si el car�cter es una letra min�scula o may�scula.
		Si (caracter >= "a" Y caracter <= "z") O (caracter >= "A" Y caracter <= "Z") Entonces
			var <- Verdadero
		Sino
			esValido <- Falso // Si el car�cter no es una letra, la cadena no es v�lida.
		FinSi
	FinPara
Fin Funcion

// Funci�n para solicitar y validar una palabra al usuario hasta que sea solo letras.
Funcion valorRegistrado <- ingresarDatos ( )
	// Declara 'esCadena' como una variable l�gica para controlar la validaci�n.
	Definir esCadena Como Logico
	
	Repetir
		Escribir "Ingresa la palabra :" // Pide al usuario que ingrese una palabra.
		Leer valorEscrito // Lee la entrada del usuario.
		// Llama a 'revisarCadena' para verificar si la entrada contiene solo letras.
		esCadena <- revisarCadena(valorEscrito)
	Hasta Que esCadena == Verdadero // Repite el ciclo hasta que la entrada sea una cadena v�lida
	// Asigna el 'valorEscrito' validado a la variable de retorno de la funci�n.
	valorRegistrado <- valorEscrito
	
Fin Funcion

// Proceso principal
Proceso PalabraPalindromo
	// Llama a la funci�n 'ingresarDatos' para obtener una palabra v�lida del usuario.
	palabra <- ingresarDatos()
	// Pasa la palabra obtenida a la funci�n 'validarPalabraPalindromo' para su verificaci�n y mostrar el resultado.
	validarPalabraPalindromo(palabra)
FinProceso
	