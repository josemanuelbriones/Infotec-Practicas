// Función para verificar si una palabra es un palíndromo.
Funcion validarPalabraPalindromo ( palabra )
	// Inicializa una cadena vacía para construir la palabra invertida.
	palabraInversa <- ""
	Definir i, log Como Entero
	log <- Longitud(palabra) // Obtiene la longitud de la 'palabra' de entrada.
	
	// Itera desde el último carácter de la palabra hasta el primero.
	Para i <- log Hasta 1 Con Paso -1 Hacer
		// Concatena cada carácter, empezando por el último.
		palabraInversa <- palabraInversa + Subcadena(palabra,i,i)
	Fin Para
	// Compara la palabra original con su versión invertida.
	Si palabraInversa = palabra Entonces
		Escribir "Es un palindromo" // Si son iguales, la palabra es un palíndromo.
	SiNo
		Escribir "No es un palindromo" // Si no son iguales, la palabra no es un palíndromo.
	Fin Si
	
Fin Funcion

// Función para verificar si una cadena de texto contiene solo letras
Funcion esValido <- revisarCadena ( valorEscrito )
	// Declara 'caracter' para almacenar cada carácter de la cadena.
	Definir caracter como caracter
	Definir i, long como entero
	// Declara 'esValido' como una variable lógica para el resultado de la validación.
	Definir esValido como logico
	
	long <- Longitud(valorEscrito) // Obtiene la longitud de la cadena de entrada.
	esValido <- Verdadero // Inicialmente, asume que la cadena es válida
	
	// Itera sobre cada carácter de la cadena.
	Para i <- 1 Hasta long Con Paso 1 Hacer
		caracter <- subcadena(valorEscrito, i, i) // Extrae el carácter actual en la posición 'i'.
		// Comprueba si el carácter es una letra minúscula o mayúscula.
		Si (caracter >= "a" Y caracter <= "z") O (caracter >= "A" Y caracter <= "Z") Entonces
			var <- Verdadero
		Sino
			esValido <- Falso // Si el carácter no es una letra, la cadena no es válida.
		FinSi
	FinPara
Fin Funcion

// Función para solicitar y validar una palabra al usuario hasta que sea solo letras.
Funcion valorRegistrado <- ingresarDatos ( )
	// Declara 'esCadena' como una variable lógica para controlar la validación.
	Definir esCadena Como Logico
	
	Repetir
		Escribir "Ingresa la palabra :" // Pide al usuario que ingrese una palabra.
		Leer valorEscrito // Lee la entrada del usuario.
		// Llama a 'revisarCadena' para verificar si la entrada contiene solo letras.
		esCadena <- revisarCadena(valorEscrito)
	Hasta Que esCadena == Verdadero // Repite el ciclo hasta que la entrada sea una cadena válida
	// Asigna el 'valorEscrito' validado a la variable de retorno de la función.
	valorRegistrado <- valorEscrito
	
Fin Funcion

// Proceso principal
Proceso PalabraPalindromo
	// Llama a la función 'ingresarDatos' para obtener una palabra válida del usuario.
	palabra <- ingresarDatos()
	// Pasa la palabra obtenida a la función 'validarPalabraPalindromo' para su verificación y mostrar el resultado.
	validarPalabraPalindromo(palabra)
FinProceso
	