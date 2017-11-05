package tests

import domain.Articulo
import org.junit.Test
import org.junit.Assert

class TestArticulos {
	var unArticulo = new Articulo("Coca Cola", 2, null,  1, 1)
	
	@Test
	def altoTest(){
		Assert.assertEquals(2,unArticulo.cant_stock)
	}
}