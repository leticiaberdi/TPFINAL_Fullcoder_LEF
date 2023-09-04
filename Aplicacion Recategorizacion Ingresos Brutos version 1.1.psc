//1. 2. Realizar un programa que calcule la media de gastos realizados en x cantidad de meses definidos por el usuario.

Algoritmo recategorizacion_ingresos_brutos
	Escribir "Ingresos Brutos Regimen Simplificado CABA"
	Escribir "Bienvenidos/as, este sistema sirve para saber si tenés que recategorizarte en Enero 2024"
	Escribir "Aplica solamente a aquellos/as contribuyentes que no declaran local de ventas"
	Escribir " "
	Escribir " "
				
			Definir acumulado_ventas Como Real
			Definir ventas Como Real
					
			ventas<-0
			m<-12
			
			Escribir "Ingresar la letra de tu Categoría vigente (En mayúscula)"
			Escribir " "
			Leer categoriaVigente
			
				
				Escribir " "	
				Escribir "Ingresar las ventas de enero a diciembre (con decimales separados por punto)"
				Escribir " "
				Para x<-1 hasta 12 
				Leer ventas
				acumulado_ventas<-acumulado_ventas+ventas
				FinPara
						
		
						SI acumulado_ventas>=0 Y acumulado_ventas<=748390 Entonces
							nuevaCategoria<-"A"
							SiNo
								SI acumulado_ventas>748390 Y acumulado_ventas<=1112460 Entonces
								nuevaCategoria<-"B"
								SiNo	 
									SI acumulado_ventas>1112460 Y acumulado_ventas<=1557445 Entonces
									nuevaCategoria<-"C"
								FinSi
							FinSi
						FinSi
						
				SI categoriaVigente=nuevaCategoria Entonces
					Escribir "No corresponde que se recategorice. Continúa en la categoria  " categoriaVigente
				SiNo
					Escribir "Corresponde que se recategorice. Su nueva categoria es " nuevaCategoria
				FinSi
			
	
	FinAlgoritmo