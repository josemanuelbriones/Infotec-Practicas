Funcion validarPalabraPalindromo ( palabra )
	palabraInversa <- ""
	Definir i, log Como Entero
	log <- Longitud(palabra)
	
	Para i <- log Hasta 1 Con Paso -1 Hacer
		palabraInversa <- palabraInversa + Subcadena(palabra,i,i)
	Fin Para
	
	Si palabraInversa = palabra Entonces
		Escribir "Es palindromo"
	SiNo
		Escribir "No es palindromo"
	Fin Si
	
Fin Funcion

Funcion esValido <- revisarCadena ( valorEscrito )
	Definir caracter como caracter
	Definir i, long como entero
	Definir esValido como logico
	
	long <- Longitud(valorEscrito)
	esValido <- Verdadero
	Para i <- 1 Hasta long Con Paso 1 Hacer
		
		
		caracter <- subcadena(valorEscrito, i, i)
		Si (caracter >= "a" Y caracter <= "z") O (caracter >= "A" Y caracter <= "Z") Entonces
			var <- Verdadero
		Sino
			esValido <- Falso
		FinSi
	FinPara
Fin Funcion

Funcion valorRegistrado <- ingresarDatos ( )
	Definir esCadena Como Logico
	
	Repetir
		Escribir "Ingresa la palabra ", num, ":"
		Leer valorEscrito
		esCadena <- revisarCadena(valorEscrito)
	Hasta Que esCadena == Verdadero
	
	valorRegistrado <- valorEscrito
	
Fin Funcion


Proceso PalabraPalindromo
	palabra <- ingresarDatos()
	validarPalabraPalindromo(palabra)
FinProceso
	