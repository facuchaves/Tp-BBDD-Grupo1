package conexion

import conexion.Conexion
import conexion.PruebaArticulo
import java.util.List
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils

@Controller
class BBDDController {

	extension JSONUtils = new JSONUtils

	@Get("/heladera/articulos")
	def Result inventario() {
		var List<PruebaArticulo> articulos// = Conexion.obtenerArticulosAgrupados()

		response.contentType = ContentType.APPLICATION_JSON
		ok(articulos.toJson)

	}


	def static void main(String[] args) {
		XTRest.start(9000, BBDDController)
	}
}
