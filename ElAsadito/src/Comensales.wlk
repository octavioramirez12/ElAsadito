class ExcepcionElComensalAtentoNoTieneElObjeto inherits Exception{}

class Comensal
{
	const nombre
	var posicion
	var criterios
	var loQueCome = []
	
	method posicion() = posicion
	method posicion(unaPosicion){posicion = unaPosicion}
	
	method objetosCerca()
	{
		return posicion.objetosCerca()
	}
	
	method ofrecerComida(unaComida)
	{
		if(criterios.all({criterio => criterio.cumpleUnaComida(unaComida)}))
		{
			loQueCome.add(unaComida)
		}
	}
	
	method lePiden(solicitante, unObjeto)
	
	method pedirObjetoA(unComensal, unObjeto)
	{
		if(unComensal.posicion().objetosCerca().contains(unObjeto))
		{
		
			unComensal.lePiden(self, unObjeto)
		}
		else
		{
			throw new ExcepcionElComensalAtentoNoTieneElObjeto(message = "El comensal no tiene el objeto que se pidió salame")
		}
	}
}

class Posicion
{
	var objetosCerca  
	method objetosCerca() = objetosCerca
	method objetosCerca(unosObjetos){objetosCerca = unosObjetos}
}


class ComensalSordo inherits Comensal
{
	method lePiden(solicitante, unObjeto)
	{
		const primerObjetoAMano = posicion.objetosCerca().first()
		self.objetosCerca().remove(primerObjetoAMano)
		solicitante.objetosCerca(solicitante.objetosCerca().add(primerObjetoAMano))
	}
}

class ComensalConMalCaracter inherits Comensal
{
	method lePiden(solicitante, unObjeto)
	{
		var objetosCerca = posicion.objetosCerca()
		posicion.objetosCerca([])
		solicitante.posicion().objetosCerca(solicitante.posicion().objetosCerca().addAll(objetosCerca))
	}
}

class ComensalCharlatan inherits Comensal
{	
	method lePiden(solicitante, unObjeto)
	{
		const posicionDelSolicitante = solicitante.posicion()
		solicitante.posicion(posicion)
		posicion = posicionDelSolicitante
	}
}

class ComensalAtento inherits Comensal
{
	method lePiden(solicitante, unObjeto)
	{
		solicitante.posicion().objetosCerca().add(unObjeto)
		posicion.objetosCerca().remove(unObjeto)
	}
}