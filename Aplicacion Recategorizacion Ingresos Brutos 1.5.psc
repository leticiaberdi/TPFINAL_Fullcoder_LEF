
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
			Definir categoriaVigente Como Caracter
			Definir nuevaCategoria Como Caracter
			Definir ventasEneAbri Como Entero
			Definir acumuladoVentasEneAbri Como Entero
			Definir ventasMayDic Como Entero
			Definir acumuladVentasMayDic Como Entero
			Definir maximoFacturacion Como Entero
			
			ventasEneAbri<-0
			ventasMayDic<-0
			// Los importes mínimos o máximos de facturación son modificados una vez al año por AGIP, entre enero y febrero de cada año"
			//Importe mínimo de facturación según AGIP
			A<-0
			//Importes que aplican tanto como mínimos o máximos de cada categoría, identificada con la letra mayúscula"
			A1<-748390
			B1<-1112460
			C1<-1557445
			D1<-1934280
			E1<-2277690
			F1<-2847110
			G1<-3416530
			// Importe máximo de facturación según AGIP
			H1<-4229990
			
			
	//Menú Principal			
	Repetir
		
		
		Escribir "Que desea hacer?"
		Escribir "1. Recategorización Ingresos Brutos"
		Escribir "2. Calcular importe estimado mensual a facturar en los próximos cuatro meses (para permanecer en la misma categoría)"
		Escribir "3. Salir"
		Escribir " "
		Leer menuPrincipal
		Escribir " "
			Si menuPrincipal<=0 O menuPrincipal>=4 Entonces
				Escribir "Ha ingresado una opción errónea. Ingréselo nuevamente, gracias"
			FinSi
		
	
		
//Opción 1: Recategorización Ingresos Brutos
		SI menuPrincipal=1 Entonces		
			// Ingresos de Ventas de enero a diciembre, dividido a abril para luego poder consultar estimado de facturación.
			
				Escribir "Ingresar la letra de tu Categoría vigente"
					leer categoriaVigente
					categoriaVigente<-MAYUSCULAS(categoriaVigente)				
						SI categoriaVigente>"H" Entonces
							Escribir "La letra ingresada no corresponde a una categoría vigente."
						FinSi
					
			// Hasta abril	
				Escribir "Ingresar las ventas de enero a abril"
					Para x<-1 hasta 4 
						Leer ventasEneAbri
						SI x<4 Entonces
							Escribir "Ingrese las ventas del mes siguiente"
						FinSi
						acumuladoVentasEneAbri<-acumuladoVentasEneAbri+ventasEneAbri
					FinPara
				
			// Desde abril a diciembre, y va a servir para el cálculo del estimado de facturación mensual	
				Escribir "Ingresar las ventas de mayo a diciembre"
				
					Para x<-5 hasta 12
						Leer ventasMayDic
						acumuladoVentasMayDic<-acumuladoVentasMayDic+ventasMayDic
						Si x<12 Entonces
							Escribir "Ingrese las ventas del mes siguiente"	
						Finsi	
					FinPara
			// El acumulado de ventas para poder comparar y ubicar al contribuyente en la categoria de corresponda	
				acumuladoVentas<-acumuladoVentasEneAbri+acumuladoVentasMayDic
				
			// Dato a imprimir para poder corroborar que la comparativa está categorizando bien	
				Escribir " "
				Escribir "El total de ventas es $ " acumuladoVentas
				// Acumulado comparado con todas las categorías. Acá no utilicé Según, porque hay que ingresar variable númerica
				// Si quería ingresar la relación lógica como opción daba error, y por eso elegí el condicional Si Entonces
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
						categoríaRecategorizacion<-categoríaVigente
					SiNo
						Escribir "Corresponde que se recategorice. Su nueva categoria es " nuevaCategoria
						categoríaRecategorizacion<-nuevaCategoria
					FinSi
				FinSi	
		FinSi				
		//
		SI menuPrincipal=2 Entonces	
			// Estimado de facturación mensual. Le resto 2000$ al cálculo para asegurarme que la facturación emitida sea estimada. 
			// ...Previendo que cuando se informa un importe a facturar a un cliente, no lo tome al centavo y corra
			//...el riesgo de pasarse de categoría
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