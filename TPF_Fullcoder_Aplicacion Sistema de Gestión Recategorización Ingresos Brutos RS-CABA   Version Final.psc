// Titulos
Algoritmo recategorizacion_ingresos_brutos
	Escribir 'Sistema de Gesti�n Recategorizaci�n Ingresos Brutos RS-CABA  '
	Escribir 'Bienvenidos/as, este sistema sirve para saber si ten�s que recategorizarte en Enero 2024'
	Escribir 'Aplica solamente a aquellos/as contribuyentes que no declaran local de ventas'
	Escribir ' '
	Escribir ' '
	// Definicion de tipo de dato	
	Definir acumuladoVentas Como Entero
	Definir ventasMensualesEstimadas Como Entero
	Definir categoriaVigente Como Cadena
	Definir nuevaCategoria Como Cadena
	Definir ventasEneAbri Como Entero
	Definir acumuladoVentasEneAbri Como Entero
	Definir ventasMayDic Como Entero
	Definir acumuladVentasMayDic Como Entero
	Definir maximoFacturacion Como Entero
	ventasEneAbri <- 0
	ventasMayDic <- 0
	// Los importes m�nimos o m�ximos de facturaci�n son modificados una vez al a�o por AGIP, entre enero y febrero de cada a�o"
	// Importe m�nimo de facturaci�n seg�n AGIP
	A <- 0
	// Importes que aplican tanto como m�nimos o m�ximos de cada categor�a, identificada con la letra may�scula"
	A1 <- 748390
	B1 <- 1112460
	C1 <- 1557445
	D1 <- 1934280
	E1 <- 2277690
	F1 <- 2847110
	G1 <- 3416530
	// Importe m�ximo de facturaci�n seg�n AGIP
	H1 <- 4229990
	// Men� Principal			
	Repetir
		Escribir 'Que desea hacer?'
		Escribir '1. Recategorizaci�n Ingresos Brutos'
		Escribir '2. Calcular importe estimado mensual a facturar en los pr�ximos cuatro meses (para permanecer en la misma categor�a)'
		Escribir '3. Salir'
		Escribir ' '
		Leer menuPrincipal
		Escribir ' '
		// control de opci�n del men� que elije el usuario	
		Si menuPrincipal<=0 O menuPrincipal>=4 Entonces
			Escribir 'Ha ingresado una opci�n err�nea. Ingr�selo nuevamente, gracias'
		FinSi
		// Opci�n 1: Recategorizaci�n Ingresos Brutos
		Si menuPrincipal=1 Entonces
			// Para saber si tiene que recategorizar, se guarda la categor�a actual
			// Control por si el usuario ingresa una letra min�scula o de una categor�a inexistente
			Escribir 'Ingresar la letra de tu Categor�a vigente'
			Leer categoriaVigente
			categoriaVigente <- MAYUSCULAS(categoriaVigente)
			Mientras categoriaVigente>'H' Hacer
				Escribir 'Ingrese la letra ingresada de su Categor�a Vigente nuevamente'
				Leer categoriaVigente
				categoriaVigente <- MAYUSCULAS(categoriaVigente)
			FinMientras
			// Ingresos de Ventas de enero a diciembre, dividido a abril para luego poder consultar estimado de facturaci�n
			// Control por si el usuario introduce un dato no n�merico
			// Hasta abril	
			acumuladoVentasEneAbri <- 0
			ventasEneAbri <- 0
			Escribir 'Ingresar las ventas de enero a abril'
			Para x<-1 Hasta 4 Hacer
				Leer captura
				resultado1 <- validar1(captura)
				ventasEneAbri <- resultado1
				Si x<4 Entonces
					Escribir 'Ingrese las ventas del mes siguiente'
				FinSi
				acumuladoVentasEneAbri <- acumuladoVentasEneAbri+ventasEneAbri
			FinPara
			// Desde abril a diciembre, y va a servir para el c�lculo del estimado de facturaci�n mensual	
			acumuladoVentasMayDic <- 0
			ventasMayDic <- 0
			Escribir 'Ingresar las ventas de mayo a diciembre'
			Para x<-5 Hasta 12 Hacer
				Leer captura
				resultado2 <- validar2(captura)
				ventasMayDic <- resultado2
				Si x<12 Entonces
					Escribir 'Ingrese las ventas del mes siguiente'
				FinSi
				acumuladoVentasMayDic <- acumuladoVentasMayDic+ventasMayDic
			FinPara
			// El acumulado de ventas para poder comparar y ubicar al contribuyente en la categoria de corresponda	
			acumuladoVentas <- acumuladoVentasEneAbri+acumuladoVentasMayDic
			// Dato a imprimir para poder corroborar que la comparativa est� categorizando bien	
			Escribir 'El total de ventas es $ ', acumuladoVentas
			// Acumulado comparado con todas las categor�as. Ac� no utilic� Seg�n, porque hay que ingresar variable n�merica
			// Si quer�a ingresar la relaci�n l�gica como opci�n daba error, y por eso eleg� el condicional Si Entonces
			Si acumuladoVentas>=A Y acumuladoVentas<=A1 Entonces
				nuevaCategoria <- 'A'
			SiNo
				Si acumuladoVentas>A1 Y acumuladoVentas<=B1 Entonces
					nuevaCategoria <- 'B'
				SiNo
					Si acumuladoVentas>B1 Y acumuladoVentas<=C1 Entonces
						nuevaCategoria <- 'C'
					SiNo
						Si acumuladoVentas>C1 Y acumuladoVentas<=D1 Entonces
							nuevaCategoria <- 'D'
						SiNo
							Si acumuladoVentas>D1 Y acumuladoVentas<=E1 Entonces
								nuevaCategoria <- 'E'
							SiNo
								Si acumuladoVentas>E1 Y acumuladoVentas<=F1 Entonces
									nuevaCategoria <- 'F'
								SiNo
									Si acumuladoVentas>F1 Y acumuladoVentas<=G1 Entonces
										nuevaCategoria <- 'G'
									SiNo
										Si acumuladoVentas>G1 Y acumuladoVentas<=H1 Entonces
											nuevaCategoria <- 'H'
										SiNo
											// Esta �ltima opci�n surgi� en la prueba, porque pod�a excederse en las ventas, y queda afuera de este r�gimen			
											Si acumuladoVentas>H1 Entonces
												Escribir 'Deber� pasar a R�gimen General'
											FinSi
										FinSi
									FinSi
								FinSi
							FinSi
						FinSi
					FinSi
				FinSi
			FinSi
			// Comparativa con categor�a anterior para determinar si tiene que recategorizarse o no.								
			Si acumuladoVentas<=H1 Entonces
				Si categoriaVigente=nuevaCategoria Entonces
					Escribir 'No corresponde que se recategorice. Contin�a en la categoria  ', categoriaVigente
					CATEGORIARECATEGORIZACION <- categoriaVigente
				SiNo
					Escribir 'Corresponde que se recategorice. Su nueva categoria es ', nuevaCategoria
					CATEGORIARECATEGORIZACION <- nuevaCategoria
				FinSi
			FinSi
		FinSi
		Si menuPrincipal=2 Entonces
			// Estimado de facturaci�n mensual. Le resto 2000$ al c�lculo para asegurarme que la facturaci�n emitida sea estimada. 
			// ...Previendo que cuando se informa un importe a facturar a un cliente, no lo tome al centavo y corra
			// ...el riesgo de pasarse de categor�a
			Escribir 'Ingresar el m�ximo de facturaci�n informado por AGIP de su categor�a a Enero 2024?'
			Leer maximoFacturacion
			Si acumuladoVentasMayDic>0 Entonces
				ventasMensualesEstimadas <- (maximoFacturacion-2000-acumuladoVentasMayDic)/4
			SiNo
				// Esta opci�n es por si el usuario elige la opci�n 2 del men� principal directamente.
				Escribir 'Ingrese el total de ventas de Mayo a Diciembre'
				Leer totalVentasMayDic
				ventasMensualesEstimadas <- (maximoFacturacion-2000-totalVentasMayDic)/4
			FinSi
			Escribir 'El importe mensual a facturar estimado para los pr�ximos 4 meses es  $', ventasMensualesEstimadas
		FinSi
		Escribir ' '
		Escribir ' '
		Si menuPrincipal=3 Entonces
			Escribir 'Gracias por utilizar nuestros servicios'
		FinSi
	Hasta Que menuPrincipal=3
	Escribir ' '
	Escribir ' '
FinAlgoritmo

// funciones para verificar el ingreso de datos n�mericos en las ventas
Funci�n resultado1 <- validar1 (captura)
	Para i<-0 Hasta Longitud(captura) Con Paso 1 Hacer
		l <- SubCadena(captura,i,i)
		Si l>='0' Y l<='9' Entonces
			cad_a_num <- Concatenar(cad_a_num,l)
		SiNo
			hubo_letra <- Verdadero
		FinSi
	FinPara
	num1 <- ConvertirANumero(cad_a_num)
	Si num1>0 Entonces
		resultado1 <- num1
	SiNo
		Escribir 'no ingres� ning�n n�mero'
		Leer captura
		hubo_letra <- Falso
		resultado1 <- validar1(captura)
	FinSi
FinFunci�n

Funci�n resultado2 <- validar2 (captura)
	Para i<-0 Hasta Longitud(captura) Con Paso 1 Hacer
		l <- SubCadena(captura,i,i)
		Si l>='0' Y l<='9' Entonces
			cad_a_num <- Concatenar(cad_a_num,l)
		SiNo
			hubo_letra <- Verdadero
		FinSi
	FinPara
	num1 <- ConvertirANumero(cad_a_num)
	Si num1>0 Entonces
		resultado2 <- num1
	SiNo
		Escribir 'no ingres� ning�n n�mero'
		Leer captura
		hubo_letra <- Falso
		resultado2 <- validar2(captura)
	FinSi
FinFunci�n
