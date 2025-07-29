Funcion esNumero <- revisarNumero ( valorEscrito )
	Definir valorE Como Entero
	valorE <- Longitud(valorEscrito)
	esNumero <- Verdadero
	contador <- 0
	longitudCadena <- Longitud(valorEscrito)
	Para i <- 1 Hasta valorE Hacer
		valorRevisar <- Subcadena(valorEscrito, i, i)
		Segun valorRevisar Hacer
			"0","1","2","3","4","5","6","7","8","9":
			De Otro Modo:
				esNumero <- Falso
		Fin Segun
	FinPara
Fin Funcion

Funcion valorEscrito <- ingresoValor ( pregunta )
	
	Repetir
		Escribir pregunta
		Leer valorEscrito
		esNumero <- revisarNumero( valorEscrito )
		
	Hasta Que esNumero = Verdadero
Fin Funcion

Proceso Duplicados
	Escribir "Busqueda de numeros duplicados exactamente dos veces"
	
	Definir tamanoArreglo como entero
	tamanoArreglo <- ConvertirANumero(ingresoValor( "Ingresa el tamano del arreglo" ))
	
	Dimension arregloNumeros[tamanoArreglo]
	
	Para a<-1 hasta tamanoArreglo con paso 1 Hacer
		arregloNumeros[a] <- ConvertirANumero(ingresoValor( "Ingresa el numero positivo"))
	FinPara
	
	Dimension resultadosFinales[100] 
	Definir indiceResultadosFinales Como Entero
	indiceResultadosFinales <- 0 
	
	Definir numeroActual Como Entero
	Definir contadorFrecuencia Como Entero
	Definir agregado Como Logico
	
	Para i <- 0 Hasta tamanoArreglo - 1 Con Paso 1 Hacer
		
		numeroActual <- arregloNumeros[i+1]
		contadorFrecuencia <- 0
		
		Para j <- 0 Hasta tamanoArreglo - 1 Con Paso 1 Hacer
			Si arregloNumeros[j+1] = numeroActual Entonces
				contadorFrecuencia <- contadorFrecuencia + 1
			FinSi
			
		FinPara
		Si contadorFrecuencia = 2 Entonces
			agregado <- Falso
			Para k <- 0 Hasta indiceResultadosFinales - 1 Con Paso 1 Hacer
				Si resultadosFinales[k+1] = numeroActual Entonces
					agregado <- Verdadero
					
					k <- indiceResultadosFinales 
				FinSi
			FinPara
			Si No agregado Entonces
				resultadosFinales[indiceResultadosFinales+1] <- numeroActual
				indiceResultadosFinales <- indiceResultadosFinales + 1
			FinSi
		FinSi
	FinPara
	Escribir "Números que se repiten exactamente 2 veces: "
	Si indiceResultadosFinales = 0 Entonces
		Escribir "[] (Ningún número se repite exactamente 2 veces)"
	Sino
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