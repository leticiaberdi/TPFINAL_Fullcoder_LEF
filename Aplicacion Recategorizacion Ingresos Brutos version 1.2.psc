//1. 2. Realizar un programa que calcule la media de gastos realizados en x cantidad de meses definidos por el usuario.

Algoritmo recategorizacion_ingresos_brutos
	Escribir "Ingresos Brutos Regimen Simplificado CABA"
	Escribir "Este sistema sirve para saber si tenés que recategorizarte en Enero 2024"
	Escribir "Aplica solamente a aquellos contribuyentes que no declaran local de ventas"
	Escribir " "
	Escribir " "
				
			Definir acumuladoVentas Como Real
			
	Repetir
		Escribir "Que desea hacer?"
		Escribir "1. Recategorización Ingresos Brutos (Para contribuyentes Inscriptos hace más de un año)"
		Escribir "2. Recategorización Ingresos Brutos (Para contribuyentes Inscriptos hace menos de un año)"
		Escribir "3. Salir"
		Leer menuPrincipal
		Escribir " "
		Escribir " "
		//Opción 1: Recategorización Ingresos Brutos
		anio<-2023
		Definir periodo Como Caracter
		Definir ventas Como Real
		Dimension mes[12]
		Dimension ventas[12]
		Definir c Como Entero
		Definir c1 Como Entero
		SI menuPrincipal=1 Entonces
			c<-1
			c1<-1
			Mientras c>=1 Y c<=12 Hacer
				Escribir "Indique mes (En letras minúsculas, gracias)"
				Escribir "Ingrese las ventas del mes"
				Leer mes[c]
				Leer ventas[c1]
				c<-c+1
				c1<-c1+1
			FinMientras
						
		FinSi
		
		SI menuPrincipal=2 Entonces
		
				Escribir "Si hace menos de un año, indique el mes de su inscripción (Ingresar Número)" 
				Leer cantMeses
			SI cantMeses<12 Entonces
				c<-1
				c1<-1
				Mientras c>=1 Y c<=cantMeses Hacer
					Escribir "Indique mes (En letras minúsculas, gracias)"
					Escribir "Ingrese las ventas del mes"
					Leer mes[c]
					Leer ventas[c1]
					c<-c+1
					c1<-c1+1
				FinMientras
			FinSi
		FinSi
			
			
			
		FinSi
	Hasta Que menuPrincipal=3
	
	FinAlgoritmo