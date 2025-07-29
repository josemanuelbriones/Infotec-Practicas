Funcion comando <- menuMaquina (dineroAcumulado)
	Escribir "************************************"
	Escribir "* Máquina Expendedora        *"
	Escribir "************************************"
	Escribir "Dinero actual: ", dineroAcumulado, " pesos"
	Escribir "Productos disponibles:"
	Escribir " A1: $15"
	Escribir " B2: $20"
	Escribir " C3: $10"
	Escribir " D4: $5"
	Escribir ""
	Escribir "Comandos:"
	Escribir "  [NÚMERO]: Insertar moneda (1, 2, 5, 10, 20)"
	Escribir "  [LETRA][NÚMERO]: Seleccionar producto (ej. A1, B2)"
	Escribir "  RETIRAR: Devolver dinero"
	Escribir "  PARA: Salir"
	Escribir ""
	Escribir "Ingrese un comando:"
	Leer comando
Fin Funcion
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
Funcion moneda <- candidadDinero ( dineroAcumulado, valorMoneda )
	Escribir "Moneda de ", valorMoneda, " pesos aceptada."
	Esperar 2 Segundos
	moneda <- dineroAcumulado + ConvertirANumero(valorMoneda)
Fin Funcion

Funcion dineroAcumulado <- productoVendido( precioProducto, dineroDisponible )
	Si precioProducto <= dineroDisponible Entonces
		
		Escribir "Dispensando producto..."
		Esperar 3 Segundos
		Escribir "Cambio: ", dineroDisponible - precioProducto, " pesos."
		Esperar 2 Segundos
		dineroAcumulado <- 0
	SiNo
		Escribir "Dinero insuficiente. Necesitas ", precioProducto - dineroDisponible, " pesos más."
		Esperar 2 Segundos
		dineroAcumulado <- dineroDisponible
	Fin Si
Fin Funcion

Proceso MaquinaExpendedora
	Definir seguirTrabajando Como Logico
	Definir dineroAcumulado Como Entero
	Definir comando Como Caracter
	
	seguirTrabajando <- Verdadero
	dineroAcumulado = 0
	
	Repetir
		comando <- menuMaquina(dineroAcumulado)
		Segun comando Hacer
			"A1":
				precio <- 15
				dineroAcumulado <- productoVendido( precio, dineroAcumulado )
				seguirTrabajando <- Verdadero
			"B2":
				precio <- 20
				dineroAcumulado <- productoVendido( precio, dineroAcumulado )
				seguirTrabajando <- Verdadero
			"C3":
				precio <- 10
				dineroAcumulado <- productoVendido( precio, dineroAcumulado )
				seguirTrabajando <- Verdadero
			"D4":
				precio <- 35
				dineroAcumulado <- productoVendido( precio, dineroAcumulado )
				seguirTrabajando <- Verdadero
			"1","2","5","10","20":
				dineroAcumulado <- candidadDinero( dineroAcumulado,comando) 
				seguirTrabajando <- Verdadero
			"RETIRAR":
				Escribir "Se regresa: ", dineroAcumulado, " pesos."
				Esperar 2 Segundos
				dineroAcumulado <- 0
				seguirTrabajando <- Verdadero
			"PARA":
				Escribir "Apagando la máquina expendedora. ¡Hasta luego!"
				Esperar 2 Segundos
				seguirTrabajando <- Falso
			De Otro Modo:
				esNumero <- revisarNumero( comando )
				Si esNumero = Verdadero Entonces
					Escribir "Moneda de ", comando, " pesos rechazada. Solo se aceptan 1, 2, 5, 10 y 20 pesos."
					Esperar 2 Segundos
				SiNo
					Escribir "Comando no reconocido"
					Esperar 2 Segundos
				Fin Si
				
				seguirTrabajando <- Verdadero
				Esperar 2 Segundos
				
		Fin Segun
	Hasta Que seguirTrabajando = Falso
FinProceso
	