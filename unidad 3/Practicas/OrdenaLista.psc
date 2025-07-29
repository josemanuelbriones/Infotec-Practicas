Proceso OrdenaLista
	// Creamos una nueva lista donde almacenaremos los elementos a ordenar, con una capacidad máxima de 200 elementos
	Dimensión lista[200]
	// Mostrar las instrucciones al usuario
	Escribir "Ingrese los nombres (enter en blanco para terminar):"
	// Definimos la variable que contendrá el número de elementos en la lista
	cant<-0
	// Leer el primer elemento
	Leer nombre
	// Utilizando una estructura de control while, leemos los elementos uno a uno hasta que encontremos una línea en blanco (enter)
	Mientras nombre<>"" Hacer
		// Incrementar un contador para saber el número de elementos que tenemos en la lista
		cant<-cant+1
		// Insertamos el elemento la lista
		lista[cant]<-nombre
		// Utilizamos una estructura de control do while para solicitar los siguientes elementos
		Repetir
			// Obtener el siguiente elemento
			Leer nombre
			// Definimos la variable para valida
			
			// Definimos la variable para validar que el elemento no existe en la lista
			se_repite<-Falso
			// Utilizando una estructura de control for, recorremos la lista
			Para i<-1 Hasta cant Hacer
				// Utilizando una if, verificamos si el nuevo elemento ya se encuentra en la lista
				Si nombre=lista[i] Entonces
					// Establecemos el valor de la variable a Verdadero
					se_repite<-Verdadero
				FinSi
			FinPara
			// Seguiremos hasta que no se repita
		Hasta Que NO se_repite
	FinMientras
	
	// Utilizaremos una estructura de control for para ordenar la lista
	Para i<-1 Hasta cant-1 Hacer
		// Iniciamos buscando el elemento menor de la lista
		pos_menor<-i
		Para j<-i+1 Hasta cant Hacer
			Si lista[j]<lista[pos_menor] Entonces
				pos_menor<-j
			FinSi
		FinPara
		// Intercambia el que estaba en i con el menor que encontró
		aux<-lista[i]
		lista[i]<-lista[pos_menor]
		lista[pos_menor]<-aux
	FinPara
	
	// Mostrar el título
	Escribir "La lista ordenada es:"
	// Utilizando una estructura for, mostrar cada uno de los elementos en pantalla
	Para i<-1 Hasta cant Hacer
		Escribir " ",lista[i]
	FinPara
	
FinProceso