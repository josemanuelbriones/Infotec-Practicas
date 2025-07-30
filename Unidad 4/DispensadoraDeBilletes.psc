// Funci�n para calcular la cantidad de dinero que a�n falta por dispensar.
Funcion dineroFaltante <- cantidadFaltante ( cantidaSolicitada, cantidadAlmacenada, billeteAlmacenado )
	// Calcula cu�ntos billetes de la denominaci�n actual se necesitar�an idealmente.
	cantidadTotal <- cantidaSolicitada/billeteAlmacenado
	// Comprueba si la cantidad de billetes necesarios es mayor o igual a los disponibles.
	Si cantidadTotal >= cantidadAlmacenada Entonces
		// Si se necesitan m�s billetes de los que hay, se asume que se dispensan todos los disponibles.
		// Calcula cu�ntos billetes ideales faltar�an despu�s de usar todos los disponibles de esta denominaci�n.
		cantidadTotal <- cantidadTotal - cantidadAlmacenada
		// Convierte la cantidad de billetes faltantes a su valor monetario.
		dineroFaltante <- cantidadTotal * billeteAlmacenado
	SiNo
		// Si hay suficientes billetes de esta denominaci�n, el dinero faltante es el residuo
		// de la divisi�n (lo que no se pudo cubrir con este billete).
		dineroFaltante <- cantidaSolicitada%billeteAlmacenado
	Fin Si
Fin Funcion

// Funci�n para determinar cu�ntos billetes de una denominaci�n espec�fica se deben entregar.
Funcion billetesEntregados <- cantidadBilletes( cantidaSolicitada, cantidadAlmacenada, billeteAlmacenado )
	
	// Calcula cu�ntos billetes de esta denominaci�n se necesitar�an idealmente para el monto restante.
	cantidadTotal <- cantidaSolicitada / billeteAlmacenado
	// Si la cantidad ideal es mayor o igual a los billetes disponibles.
	Si cantidadTotal >= cantidadAlmacenada Entonces
		// Se entregan todos los billetes disponibles de esta denominaci�n.
		billetesEntregados <- cantidadAlmacenada
	SiNo
		// Se entregan solo los billetes necesarios para cubrir el monto.
		billetesEntregados <- cantidadTotal
	Fin Si
Fin Funcion

// Funci�n para verificar si la cantidad restante es cero, lo que significa que se pudo dispensar.
Funcion sePuedeDispensar <- revisarDispensar ( cantidadRestante )
	// Si la cantidad restante es 0, significa que se dispens� todo el dinero.
	Si cantidadRestante = 0 Entonces
		sePuedeDispensar<- Verdadero
	SiNo
		// Si la cantidad restante no es 0, no se pudo dispensar el monto completo.
		sePuedeDispensar <- Falso
	Fin Si
Fin Funcion

// Funci�n para verificar si una cadena de texto representa un n�mero v�lido.
Funcion esNumero <- revisarNumero ( valorEscrito )
	// Declara 'valorE' para la longitud de la cadena.
	Definir valorE Como Entero
	// Obtiene la longitud de la cadena.
	valorE <- Longitud(valorEscrito)
	// Asume que la cadena es un n�mero hasta que se demuestre lo contrario.
	esNumero <- Verdadero
	// 'contador' y 'longitudCadena' se declaran pero no se utilizan en esta funci�n.
	contador <- 0
	longitudCadena <- Longitud(valorEscrito)
	// Itera sobre cada car�cter de la cadena.
	Para i <- 1 Hasta valorE Hacer
		// Extrae el car�cter actual.
		valorRevisar <- Subcadena(valorEscrito, i, i)
		// Comprueba si el car�cter es un d�gito.
		Segun valorRevisar Hacer
				// Si es un d�gito, no hace nada (sigue siendo v�lido).
			"0","1","2","3","4","5","6","7","8","9":
			De Otro Modo:
				// Si no es un d�gito, la cadena no es un n�mero.
				esNumero <- Falso
		Fin Segun
	FinPara
Fin Funcion

// Funci�n para mostrar el inventario de billetes y solicitar la cantidad a dispensar.
Funcion cantidaSolicitada <- intrduccionCantidadSolicitada (	billete20, billete50, billete100, billete200, billete500, billete1000 )
	Escribir "************************************"
	Escribir "* Dispensadora de Billetes*"
	Escribir "************************************"
	Escribir "Inventario actual:"
	Escribir "billetes de a 20: ", billete20," billetes" 
	Escribir "billetes de a 50: ", billete50," billetes" 
	Escribir "billetes de a 100: ", billete100," billetes" 
	Escribir "billetes de a 200: ", billete200," billetes" 
	Escribir "billetes de a 500: ", billete500," billetes" 
	Escribir "billetes de a 1000: ", billete1000," billetes" 
	Escribir "Ingrese la cantidad a dispensar (0 para salir):"
	Leer cantidaSolicitada // Lee la cantidad que el usuario desea dispensar.
Fin Funcion



Proceso DispensadoraDeBilletes
	// Inicializa el inventario de billetes de la dispensadora.
	billete20 <- 10
	billete50 <- 10
	billete100 <- 10
	billete200 <- 10
	billete500 <- 10
	billete1000 <- 10
	
	Definir contidadsocitada Como Entero
	Definir continuar Como Logico // Variable l�gica para controlar si el programa debe continuar ejecut�ndose.
	continuar <- Verdadero
	
	// Ciclo principal del programa que se repite hasta que el usuario decida salir.
	Repetir
		// Solicita la cantidad a dispensar y la convierte a n�mero.
		cantidaSolicitada <- ConvertirANumero(intrduccionCantidadSolicitada(	billete20, billete50, billete100, billete200, billete500, billete1000 ))
		// Verifica si la entrada del usuario es un n�mero v�lido.
		esNumero <- revisarNumero( ConvertirATexto(cantidaSolicitada) )
		Si esNumero = Verdadero Entonces
			// Si la cantidad solicitada es 0, el usuario quiere salir.
			Si cantidaSolicitada = 0 Entonces
				Escribir "Saliendo de la dispensadora. �Hasta luego!"
				continuar <- Falso  // Establece 'continuar' a Falso para salir del ciclo.
			SiNo
				// Si la cantidad solicitada es mayor que la capacidad m�xima te�rica del cajero.
				cantidadDineroTotal <- (billete20 * 20)+(billete50 * 50)+ (billete100 * 100)+(billete200 * 200)+(billete500 * 500)+(billete1000 * 1000)
				Si cantidaSolicitada > cantidadDineroTotal Entonces
					Escribir "Lo sentimos, no se puede dispensar ", cantidaSolicitada, " pesos en este momento."
					Escribir "El cajero no cuenta con la combinaci�n de billetes suficiente."
					continuar <- Verdadero // Permite al usuario intentar de nuevo.
				SiNo
					// Almacena la cantidad solicitada original para mostrarla al final.
					cantidadFija <- cantidaSolicitada
					
					// Calcula y dispensa billetes de 1000 pesos.
					b1000 <- cantidadBilletes ( cantidaSolicitada, billete1000, 1000 )
					cantidaSolicitada <- cantidadFaltante( cantidaSolicitada, billete1000, 1000 )
					
					// Calcula y dispensa billetes de 500 pesos.
					b500 <- cantidadBilletes ( cantidaSolicitada, billete500, 500 )
					cantidaSolicitada <- cantidadFaltante( cantidaSolicitada, billete500, 500 )
					
					// Calcula y dispensa billetes de 200 pesos.
					b200 <- cantidadBilletes ( cantidaSolicitada, billete200, 200 )
					cantidaSolicitada = cantidadFaltante( cantidaSolicitada, billete200, 200 )
					
					// Calcula y dispensa billetes de 100 pesos.
					b100 <- cantidadBilletes ( cantidaSolicitada, billete100, 100 )
					cantidaSolicitada = cantidadFaltante( cantidaSolicitada, billete100, 100 )
					
					// Calcula y dispensa billetes de 50 pesos.
					b50 <- cantidadBilletes ( cantidaSolicitada, billete50, 50 )
					cantidaSolicitada = cantidadFaltante( cantidaSolicitada, billete50, 50 )
					
					// Calcula y dispensa billetes de 20 pesos.
					b20 <- cantidadBilletes ( cantidaSolicitada, billete20, 20 )
					cantidaSolicitada = cantidadFaltante( cantidaSolicitada, billete20, 20 )
					
					// Verifica si la cantidad restante es 0.
					sePuedeDispensar <- revisarDispensar ( cantidaSolicitada )
					
					Si sePuedeDispensar = Verdadero Entonces
						Escribir "Dispensando la cantidad ", cantidadFija, " pesos."
						// Muestra la cantidad de cada billete dispensado, usando 'trunc' para eliminar decimales.
						Escribir "billetes de a 1000: ",trunc( b1000)," billetes"
						Escribir "billetes de a 500: ", trunc(b500)," billetes"
						Escribir "billetes de a 200: ", trunc(b200)," billetes"
						Escribir "billetes de a 100: ", trunc(b100)," billetes"
						Escribir "billetes de a 50: ", trunc(b50)," billetes"
						Escribir "billetes de a 20: ", trunc(b20)," billetes"
						
						continuar <- Falso // Sale del ciclo despu�s de una dispensaci�n exitosa.
					SiNo
						Escribir "Lo sentimos, no se puede dispensar la cantidad solicitada ", cantidadFija, " pesos en este momento."
						Escribir "Favor de ingresar otra cantidad"
						continuar <- Verdadero // Permite al usuario intentar de nuevo.
					Fin Si
				Fin Si
			Fin Si
			Esperar 2 Segundos // Espera 2 segundos antes de la siguiente interacci�n.
		SiNo
			Escribir "Debe de ser cantidad en numeros" // Mensaje de error si la entrada no es num�rica.
			continuar <- Verdadero // Permite al usuario intentar de nuevo.
			Esperar 2 Segundos // Espera 2 segundos antes de la siguiente interacci�n.
		Fin Si
	Hasta Que continuar = Falso // El bucle contin�a hasta que 'continuar' sea Falso.
FinProceso