// Funci�n para mostrar el men� principal de la m�quina expendedora.
Funcion comando <- menuMaquina (dineroAcumulado)
	Escribir "************************************"
	Escribir "*       M�quina Expendedora        *"
	Escribir "************************************"
	// Muestra el dinero que el usuario ha insertado hasta el momento.
	Escribir "Dinero actual: ", dineroAcumulado, " pesos"
	Escribir "Productos disponibles:"
	Escribir " A1: $15"
	Escribir " B2: $20"
	Escribir " C3: $10"
	Escribir " D4: $35"
	Escribir ""
	Escribir "Comandos:"
	Escribir "  [N�MERO]: Insertar moneda (1, 2, 5, 10, 20)"
	Escribir "  [LETRA][N�MERO]: Seleccionar producto (ej. A1, B2)"
	Escribir "  RETIRAR: Devolver dinero"
	Escribir "  PARA: Salir"
	Escribir ""
	Escribir "Ingrese un comando:"
	Leer comando // Lee la entrada del usuario y la devuelve como 'comando'.
Fin Funcion

// Funci�n para verificar si una cadena de texto representa un n�mero v�lido.
Funcion esNumero <- revisarNumero ( valorEscrito )
	// Declara 'valorE' para almacenar la longitud de la cadena.
	Definir valorE Como Entero
	// Obtiene la longitud de la cadena de entrada.
	valorE <- Longitud(valorEscrito)
	esNumero <- Verdadero
	
	Para i <- 1 Hasta valorE Hacer
		// Extrae el car�cter actual en la posici�n 'i'.
		valorRevisar <- Subcadena(valorEscrito, i, i)
		// Eval�a el car�cter extra�do.
		Segun valorRevisar Hacer
			// Si el car�cter es un d�gito del 0 al 9, no se hace nada, ya que es v�lido.
			"0","1","2","3","4","5","6","7","8","9":
			De Otro Modo:
				// Si el car�cter no es un d�gito, la cadena no es un n�mero.
				esNumero <- Falso
		Fin Segun
	FinPara
Fin Funcion

// Funci�n para procesar la inserci�n de una moneda.
Funcion moneda <- candidadDinero ( dineroAcumulado, valorMoneda )
	// Informa al usuario que la moneda ha sido aceptada.
	Escribir "Moneda de ", valorMoneda, " pesos aceptada."
	Esperar 2 Segundos
	// Suma el valor de la moneda insertada (convertido a n�mero) al dinero acumulado.
	moneda <- dineroAcumulado + ConvertirANumero(valorMoneda)
Fin Funcion

// Funci�n para manejar la venta de un producto.
Funcion dineroAcumulado <- productoVendido( precioProducto, dineroDisponible )
	// Comprueba si el dinero disponible es suficiente para comprar el producto.
	Si precioProducto <= dineroDisponible Entonces
		
		Escribir "Dispensando producto..."
		Esperar 3 Segundos
		// Calcula y muestra el cambio al usuario.
		Escribir "Cambio: ", dineroDisponible - precioProducto, " pesos."
		Esperar 2 Segundos
		// Resetea el dinero acumulado a 0 despu�s de una compra exitosa.
		dineroAcumulado <- 0
	SiNo
		// Informa al usuario que el dinero es insuficiente y cu�nto falta.
		Escribir "Dinero insuficiente. Necesitas ", precioProducto - dineroDisponible, " pesos m�s."
		Esperar 2 Segundos
		// Si no hay suficiente dinero, el dinero acumulado permanece igual.
		dineroAcumulado <- dineroDisponible
	Fin Si
Fin Funcion

Proceso MaquinaExpendedora
	// Declara una variable l�gica para controlar si el programa debe seguir ejecut�ndose.
	Definir seguirTrabajando Como Logico
	// Declara una variable entera para llevar el registro del dinero insertado por el usuario.
	Definir dineroAcumulado Como Entero
	// Declara una variable de tipo car�cter para almacenar el comando ingresado por el usuario.
	Definir comando Como Caracter
	// Inicializa 'seguirTrabajando' a Verdadero para iniciar el ciclo principal.
	seguirTrabajando <- Verdadero
	dineroAcumulado = 0
	// Ciclo principal de la m�quina expendedora, se repite hasta que el usuario decida salir.
	Repetir
		// Muestra el men� y lee el comando del usuario.
		comando <- menuMaquina(dineroAcumulado)
		// Eval�a el comando ingresado por el usuario.
		Segun comando Hacer
			// Casos de productos en venta
			"A1":
				precio <- 15 // Define el precio del producto.
				dineroAcumulado <- productoVendido( precio, dineroAcumulado )
				seguirTrabajando <- Verdadero
			"B2":
				precio <- 20 // Define el precio del producto.
				dineroAcumulado <- productoVendido( precio, dineroAcumulado )
				seguirTrabajando <- Verdadero
			"C3":
				precio <- 10 // Define el precio del producto.
				dineroAcumulado <- productoVendido( precio, dineroAcumulado )
				seguirTrabajando <- Verdadero
			"D4":
				precio <- 35 // Define el precio del producto.
				dineroAcumulado <- productoVendido( precio, dineroAcumulado )
				seguirTrabajando <- Verdadero
			// Caso: Inserci�n de monedas v�lidas.
			"1","2","5","10","20":
				// Llama a la funci�n para procesar la moneda y actualizar el dinero acumulado.
				dineroAcumulado <- candidadDinero( dineroAcumulado,comando) 
				seguirTrabajando <- Verdadero
			// Caso: El usuario desea retirar su dinero.
			"RETIRAR":
				Escribir "Se regresa: ", dineroAcumulado, " pesos."
				Esperar 2 Segundos
				dineroAcumulado <- 0
				seguirTrabajando <- Verdadero
			// Caso: El usuario desea salir de la m�quina.
			"PARA":
				Escribir "Apagando la m�quina expendedora. �Hasta luego!"
				Esperar 2 Segundos
				seguirTrabajando <- Falso
			// Caso por defecto: Si el comando no coincide con ninguno de los anteriores.
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
	