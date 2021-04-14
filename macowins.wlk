class MacoWins{
	var ventas = #{} 
	
	method ventasDeEseDia(dia)  = ventas.filter({venta => venta.fecha() == dia})
	
	method gananciaDelDia(dia) = self.ventasDeEseDia(dia).sum({venta => venta.precioTotal()})
}

class Venta{
	var tipoDePago
	var property fecha
	var prendasVendidas = #{}
	
	method precioTotal() = prendasVendidas.sum({prenda => tipoDePago.criterioDePago(prenda.precio())})
}

class Tarjeta{
	const coeficienteFijo
	var cuotas
	
	method criterioDePago(precioPrenda) = precioPrenda + self.criterioTarjeta(precioPrenda)
	method criterioTarjeta(precioPrenda) =  cuotas * coeficienteFijo + (precioPrenda *0.01)
}

object efectivo{
	method criterioDePago(precioPrenda) = precioPrenda
}


 class Prenda{
 	var estadoDePrenda
 	const precioTipo
 	
 	method precio() = estadoDePrenda.precioSegunEstado(precioTipo)
 }
 
 class Saco inherits Prenda{
 }
 
 class Pantalone inherits Prenda{
 }
 
 class Camisa inherits Prenda{
 }
 
 object nueva{
 	method precioSegunEstado(precioTipo) = precioTipo
 }
 
 class Promocion{
 	const valorFijo
 	
 	method precioSegunEstado(precioTipo) = precioTipo - valorFijo
 }
 
 object liquidacion{
 	method precioSegunEstado(precioTipo) = precioTipo / 2
 }
 

