//1. 2. Realizar un programa que calcule la media de gastos realizados en x cantidad de meses definidos por el usuario.

Algoritmo recategorizacion_ingresos_brutos
	Escribir "Ingresos Brutos Regimen Simplificado CABA"
	Escribir "Bienvenidos/as, este sistema sirve para saber si tenés que recategorizarte en Enero 2024"
	Escribir "Aplica solamente a aquellos/as contribuyentes que no declaran local de ventas"
	Escribir " "
	Escribir " "
				
			Definir acumuladoVentas Como Entero
			Definir ventas Como Entero
					
			ventas<-0
			m<-12
			
			Escribir "Ingresar la letra de tu Categoría vigente (En mayúscula)"
			Escribir " "
			Leer categoriaVigente
			
				
				Escribir " "	
				Escribir "Ingresar las ventas de enero a diciembre"
				Escribir " "
				
				Para x<-1 hasta 12 
				Leer ventas
				acumuladoVentas<-acumuladoVentas+ventas
				FinPara
				
				Escribir "El total de ventas es " acumuladoVentas
				
						SI acumuladoVentas>=0 Y acumuladoVentas<=748390 Entonces
						nuevaCategoria<-"A"
						SiNo
							SI acumuladoVentas>748390 Y acumuladoVentas<=1112460 Entonces
								nuevaCategoria<-"B"
							SiNo	 
								SI acumuladoVentas>1112460 Y acumuladoVentas<=1557445 Entonces
									nuevaCategoria<-"C"
								SiNo
									SI acumuladoVentas>1557445 Y acumuladoVentas<=1934280 Entonces
									nuevaCategoria<-"D"
									SiNo
										SI acumuladoVentas>1934280 Y acumuladoVentas<=2277690 Entonces
										nuevaCategoria<-"E"
										SiNo
											SI acumuladoVentas>2277690 Y acumuladoVentas<=2847110 Entonces
											nuevaCategoria<-"F"
											SiNo	
												SI acumuladoVentas>2847110 Y acumuladoVentas<=3416530 Entonces
												nuevaCategoria<-"G"	
												SiNo
													SI acumuladoVentas>3416530 Y acumuladoVentas<=4229990 Entonces
													nuevaCategoria<-"H"
													FinSi
												FinSi
											Finsi
										FinSi
									FinSi
								FinSi
							Finsi
						FinSi
												
				Escribir "La nueva categoria es " nuevaCategoria
				SI categoriaVigente=nuevaCategoria Entonces
					Escribir "No corresponde que se recategorice. Continúa en la categoria  " categoriaVigente
				SiNo
					Escribir "Corresponde que se recategorice. Su nueva categoria es " nuevaCategoria
				FinSi
			
	
	FinAlgoritmo