class Vegetariano
{
	method cumpleUnaComida(unaComida)
	{
		return not unaComida.tieneCarne()
	}
}

class Dietetico
{
	method cumpleUnaComida(unaComida, maxCalorias)
	{
		return unaComida.calorias() < maxCalorias
	}
}

class Alternado
{
	var ahoraQuiereComida = false
	
	method cumpleUnaComida(unaComida, maxCalorias)
	{
		ahoraQuiereComida = not ahoraQuiereComida
		return ahoraQuiereComida
	}
}