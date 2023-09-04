
// Titulos
Algoritmo recategorizacion_ingresos_brutos
	Escribir "Ingresos Brutos Regimen Simplificado CABA"
	Escribir "Bienvenidos/as, este sistema sirve para saber si ten�s que recategorizarte en Enero 2024"
	Escribir "Aplica solamente a aquellos/as contribuyentes que no declaran local de ventas"
	Escribir " "
	Escribir " "
	
//Definicion de tipo de dato	
			Definir acumuladoVentas Como Entero
			Definir ventasMensualesEstimadas Como Entero
			
			ventasEneAbri<-0
			ventasMayDic<-0
			A<-0
			A1<-748390
			B1<-1112460
			C1<-1557445
			D1<-1934280
			E1<-2277690
			F1<-2847110
			G1<-3416530
			H1<-4229990
			
			
//Men� Principal			
	Repetir
		
		Escribir "Que desea hacer?"
		Escribir "1. Recategorizaci�n Ingresos Brutos"
		Escribir "2. Calcular importe estimado mensual a facturar en los pr�ximos cuatro meses (para permanecer en la misma categor�a)"
		Escribir "3. Salir"
		Escribir " "
		Escribir " "
		Leer menuPrincipal
		Escribir " "
		Escribir " "
		
		
//Opci�n 1: Recategorizaci�n Ingresos Brutos
		SI menuPrincipal=1 Entonces		
			// Ingresos de Ventas de enero a diciembre, dividido a abril para luego poder consultar estimado de facturaci�n.
			
				Escribir "Ingresar la letra de tu Categor�a vigente"
				Leer categoriaVigente
				Escribir "Ingresar las ventas de enero a abril"
			// hasta abril	
				Para x<-1 hasta 4 
					Leer ventasEneAbri
					Si x<4 Entonces
						Escribir "Ingrese las ventas del mes siguiente"
					FinSi
					acumuladoVentasEneAbr<-acumuladoVentasEneAbr+ventasEneAbri
				FinPara
			// desde abril a diciembre, y va a servir para el c�lculo del estimado de facturaci�n mensual	
				Escribir "Ingresar las ventas de mayo a diciembre"
				
				Para x<-5 hasta 12
					Si ventasMayDic>=0 Entonces
					 Leer ventasMayDic
					 Si x<12 Entonces
					 	Escribir "Ingrese las ventas del mes siguiente"
					 FinSi
					SiNo
					 Escribir "El importe de ventas mensuales no puede ser menor que cero."
					FinSi 
					acumuladoVentasMayDic<-acumuladoVentasMayDic+ventasMayDic
				FinPara
			// el acumulado de ventas para poder comparar y ubicar al contribuyente en la categoria de corresponda	
				acumuladoVentas<-acumuladoVentasEneAbri+acumuladoVentasMayDic
				
			// Dato a imprimir para poder corroborar que la comparativa est� categorizando bien	
				Escribir "El total de ventas es " acumuladoVentas
				// acumulado comparado con todas las categor�as. Ac� no utilic� Seg�n, porque hay que ingresar variable n�merica
				// si quer�a ingresar la relaci�n l�gica como opci�n daba error, y por eso eleg� el condicional Si Entonces
						SI acumuladoVentas>=A Y acumuladoVentas<=A1 Entonces
							nuevaCategoria<-"A"
							SiNo
							
							SI acumuladoVentas>A1 Y acumuladoVentas<=B1 Entonces
								nuevaCategoria<-"B"
								SiNo	 
							
								SI acumuladoVentas>B1 Y acumuladoVentas<=C1 Entonces
									nuevaCategoria<-"C"
									SiNo
							
									SI acumuladoVentas>C1 Y acumuladoVentas<=D1 Entonces
										nuevaCategoria<-"D"
										SiNo
							
										SI acumuladoVentas>D1 Y acumuladoVentas<=E1 Entonces
											nuevaCategoria<-"E"
											SiNo
							
											SI acumuladoVentas>E1 Y acumuladoVentas<=F1 Entonces
												nuevaCategoria<-"F"
												SiNo	
							
												SI acumuladoVentas>F1 Y acumuladoVentas<=G1 Entonces
													nuevaCategoria<-"G"	
													SiNo
							
													SI acumuladoVentas>G1 Y acumuladoVentas<=H1 Entonces
														nuevaCategoria<-"H"
														SiNo
				// Esta �ltima opci�n surgi� en la prueba, porque pod�a excederse en las ventas, y queda afuera de este r�gimen			
														SI acumuladoVentas>H1 Entonces
							
														Escribir "Deber� pasar a R�gimen General"
						
														FinSi		
													FinSi		
												FinSi
										Finsi
									FinSi
								FinSi
							FinSi
						Finsi
					FinSi
				// Comparativa con categor�a anterior para determinar si tiene que recategorizarse o no.								
				SI acumuladoVentas<=H1 Entonces
					SI categoriaVigente=nuevaCategoria Entonces
						Escribir "No corresponde que se recategorice. Contin�a en la categoria  " categoriaVigente
						categor�a<-categoriaVigente
					SiNo
						Escribir "Corresponde que se recategorice. Su nueva categoria es " nuevaCategoria
						categor�a<-nuevaCategor�a
					FinSi
				FinSi	
		FinSi			
		//
		SI menuPrincipal=2 Entonces	
			// estimado de facturaci�n mensual. Le resto 2000$ al c�lculo para que la facturaci�n emitida sea estimada. 
			// Ac� previendo que cuando se informa un importe a facturar no lo tomen al centavo y corran el riesgo de 
			// pasarse de categor�a
			Escribir "Ingresar el m�ximo de facturaci�n informado por AGIP de su categor�a a Enero 2024?"
			
			Leer maximoFacturacion
				ventasMensualesEstimadas<-(maximoFacturacion-2000-acumuladoVentasMayDic)/4
			Escribir "El importe mensual a facturar estimado para los pr�ximos 4 meses es  $" ventasMensualesEstimadas
		FinSi
		Escribir " "
		Escribir " "
		SI menuPrincipal=3 Entonces
			Escribir "Gracias por utilizar nuestros servicios"
		FinSi	
	Hasta Que 	menuPrincipal=3		
		Escribir " "
		Escribir " "
		
FinAlgoritmo