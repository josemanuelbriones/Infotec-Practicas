Funcion dineroFaltante <- cantidadFaltante ( cantidaSolicitada, cantidadAlmacenada, billeteAlmacenado )
	
	cantidadTotal <- cantidaSolicitada/billeteAlmacenado
	Si cantidadTotal >= cantidadAlmacenada Entonces
		cantidadTotal <- cantidadTotal - cantidadAlmacenada
		dineroFaltante <- cantidadTotal * billeteAlmacenado
	SiNo
		dineroFaltante <- cantidaSolicitada%billeteAlmacenado
	Fin Si
Fin Funcion

Funcion billetesEntregados <- cantidadBilletes( cantidaSolicitada, cantidadAlmacenada, billeteAlmacenado )
	
	cantidadTotal <- cantidaSolicitada/billeteAlmacenado
	Si cantidadTotal >= cantidadAlmacenada Entonces
		billetesEntregados <- cantidadAlmacenada
	SiNo
		billetesEntregados <- cantidadTotal
	Fin Si
Fin Funcion

Funcion sePuedeDispensar <- revisarDispensar ( cantidadRestante )
	Si cantidadRestante = 0 Entonces
		sePuedeDispensar<- Verdadero
	SiNo
		sePuedeDispensar <- Falso
	Fin Si
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
	Leer cantidaSolicitada
Fin Funcion



Proceso DispensadoraDeBilletes
	billete20 <- 10
	billete50 <- 10
	billete100 <- 10
	billete200 <- 10
	billete500 <- 10
	billete1000 <- 10
	
	Definir contidadsocitada Como Entero
	Definir continuar Como Logico
	continuar <- Verdadero
	
	Repetir
		cantidaSolicitada <- ConvertirANumero(intrduccionCantidadSolicitada(	billete20, billete50, billete100, billete200, billete500, billete1000 ))
		esNumero <- revisarNumero( ConvertirATexto(cantidaSolicitada) )
		Si esNumero = Verdadero Entonces
			Si cantidaSolicitada = 0 Entonces
				Escribir "Saliendo de la dispensadora. ¡Hasta luego!"
				continuar <- Falso
			SiNo
				
				Si cantidaSolicitada > 18700 Entonces
					Escribir "Lo sentimos, no se puede dispensar ", cantidaSolicitada, " pesos en este momento."
					Escribir "El cajero no cuenta con la combinación de billetes suficiente."
					continuar <- Verdadero
				SiNo
					cantidadFija <- cantidaSolicitada
				
					b1000 <- cantidadBilletes ( cantidaSolicitada, billete1000, 1000 ) 
					cantidaSolicitada <- cantidadFaltante( cantidaSolicitada, billete1000, 1000 )
				
					b500 <- cantidadBilletes ( cantidaSolicitada, billete1000, 500 ) 
					cantidaSolicitada <- cantidadFaltante( cantidaSolicitada, billete1000, 500 ) 
					
					b200 <- cantidadBilletes ( cantidaSolicitada, billete1000, 200 )
					cantidaSolicitada = cantidadFaltante( cantidaSolicitada, billete1000, 200 )
					
					b100 <- cantidadBilletes ( cantidaSolicitada, billete1000, 100 ) 
					cantidaSolicitada = cantidadFaltante( cantidaSolicitada, billete1000, 100 ) 
					
					b50 <- cantidadBilletes ( cantidaSolicitada, billete1000, 50 ) 
					cantidaSolicitada = cantidadFaltante( cantidaSolicitada, billete1000, 50 ) 
					
					b20 <- cantidadBilletes ( cantidaSolicitada, billete1000, 20 ) 
					cantidaSolicitada = cantidadFaltante( cantidaSolicitada, billete1000, 20 ) 
					
					sePuedeDispensar <- revisarDispensar ( cantidaSolicitada )
					
					Si sePuedeDispensar = Verdadero Entonces
						Escribir "Dispensando la cantidad ", cantidadFija, " pesos."
						Escribir "billetes de a 1000: ",trunc( b1000)," billetes" 
						Escribir "billetes de a 500: ", trunc(b500)," billetes" 
						Escribir "billetes de a 200: ", trunc(b200)," billetes" 
						Escribir "billetes de a 100: ", trunc(b100)," billetes" 
						Escribir "billetes de a 50: ", trunc(b50)," billetes" 
						Escribir "billetes de a 20: ", trunc(b20)," billetes" 
						
						continuar <- Falso
					SiNo
						Escribir "Lo sentimos, no se puede dispensar la cantidad solicitada ", cantidadFija, " pesos en este momento."
						Escribir "Favor de ingregresar otra cantidad"
						continuar <- Verdadero
					Fin Si
					
				Fin Si			
			Fin Si
			Esperar 2 Segundos
		SiNo 
			Escribir "Debe de ser cantidad en numeros"
			continuar <- Verdadero
			Esperar 2 Segundos
		Fin Si
		
	Hasta Que continuar = Falso
	
FinProceso
	