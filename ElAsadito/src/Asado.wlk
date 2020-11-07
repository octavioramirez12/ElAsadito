import Comensales.*
import Criterios.*




object Facu inherits ComensalSordo(nombre = "Facu", posicion = new Posicion(objetosCerca = ["sal"]), criterios = [new Dietetico()])
const Moni = new ComensalAtento(nombre = "Moni", posicion = new Posicion(objetosCerca = ["pimienta", "aceite"], criterios = [new Vegetariano, new Alternado()])
const osky = new ComensalSordo(nombre = "Osky", posicion = new Posicion(objetosCerca = ["vinagre", "aceto"], criterios = [])
const vero = new ComensalConMalCaracter(nombre = "Vero", posicion = new Posicion(objetosCerca = ["oliva", "cuchillo"], criterios = [new Alternado()])

object asado {
	var comensales = #{Facu, Moni}
	var maxCalorias = 500
		
	method pasarBandejaDeComida (unaComida)
	{
		comensales.forEach({comensal => comensal.ofrecerComida(unaComida)})
	}
	
	method maxCalorias(unasCalorias){maxCalorias = unasCalorias}
}

class Comida
{
	const calorias
	const nombre
	const tieneCarne
	
	method tieneCarne() = tieneCarne
	method calorias() = calorias
	method nombre() = nombre
}
