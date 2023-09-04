
// Titulos
Algoritmo recategorizacion_ingresos_brutos
	Escribir "Ingresos Brutos Regimen Simplificado CABA"
	Escribir "Bienvenidos/as, este sistema sirve para saber si tenés que recategorizarte en Enero 2024"
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
			
			
//Menú Principal			
	Repetir
		
		Escribir "Que desea hacer?"
		Escribir "1. Recategorización Ingresos Brutos"
		Escribir "2. Calcular importe estimado mensual a facturar en los próximos cuatro meses (para permanecer en la misma categoría)"
		Escribir "3. Salir"
		Escribir " "
		Escribir " "
		Leer menuPrincipal
		Escribir " "
		Escribir " "
		
		
//Opción 1: Recategorización Ingresos Brutos
		SI menuPrincipal=1 Entonces		
			// Ingresos de Ventas de enero a diciembre, dividido a abril para luego poder consultar estimado de facturación.
			
				Escribir "Ingresar la letra de tu Categoría vigente"
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
			// desde abril a diciembre, y va a servir para el cálculo del estimado de facturación mensual	
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
				
			// Dato a imprimir para poder corroborar que la comparativa está categorizando bien	
				Escribir "El total de ventas es " acumuladoVentas
				// acumulado comparado con todas las categorías. Acá no utilicé Según, porque hay que ingresar variable númerica
				// si quería ingresar la relación lógica como opción daba error, y por eso elegí el condicional Si Entonces
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
				// Esta última opción surgió en la prueba, porque podía excederse en las ventas, y queda afuera de este régimen			
														SI acumuladoVentas>H1 Entonces
							
														Escribir "Deberá pasar a Régimen General"
						
														FinSi		
													FinSi		
												FinSi
										Finsi
									FinSi
								FinSi
							FinSi
						Finsi
					FinSi
				// Comparativa con categoría anterior para determinar si tiene que recategorizarse o no.								
				SI acumuladoVentas<=H1 Entonces
					SI categoriaVigente=nuevaCategoria Entonces
						Escribir "No corresponde que se recategorice. Continúa en la categoria  " categoriaVigente
						categoría<-categoriaVigente
					SiNo
						Escribir "Corresponde que se recategorice. Su nueva categoria es " nuevaCategoria
						categoría<-nuevaCategoría
					FinSi
				FinSi	
		FinSi			
		//
		SI menuPrincipal=2 Entonces	
			// estimado de facturación mensual. Le resto 2000$ al cálculo para que la facturación emitida sea estimada. 
			// Acá previendo que cuando se informa un importe a facturar no lo tomen al centavo y corran el riesgo de 
			// pasarse de categoría
			Escribir "Ingresar el máximo de facturación informado por AGIP de su categoría a Enero 2024?"
			
			Leer maximoFacturacion
				ventasMensualesEstimadas<-(maximoFacturacion-2000-acumuladoVentasMayDic)/4
			Escribir "El importe mensual a facturar estimado para los próximos 4 meses es  $" ventasMensualesEstimadas
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