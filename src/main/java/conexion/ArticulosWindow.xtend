package conexion

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class ArticulosWindow extends TransactionalDialog<Conexion> {

	new(WindowOwner parent, Conexion model) {
		super(parent, model)

	}

	override protected createFormPanel(Panel mainPanel) {
		this.title = "Articulos"

		var Panel top = new Panel(mainPanel).layout = new HorizontalLayout
		
		var table = new Table<PruebaArticulo>(top, typeof(PruebaArticulo)) => [
			items <=> "articulos"
			numberVisibleRows = 10
		]

		new Column<PruebaArticulo>(table) => [
			title = "Categoria"
			fixedSize = 150
			bindContentsToProperty("nombreCategoria")

		]

		new Column<PruebaArticulo>(table) => [
			title = "Nombre"
			fixedSize = 150
			bindContentsToProperty("nombre")
		]
		
		new Column<PruebaArticulo>(table) => [
			title = "Cantidad"
			fixedSize = 150
			bindContentsToProperty("stock")
		]
		
		new Column<PruebaArticulo>(table) => [
			title = "Unidad"
			fixedSize = 150
			bindContentsToProperty("nombreUnidad")
		]
		
		new Button(top) => [
			caption = "Agrupar por Unidad"
			onClick(|this.modelObject.obtenerArticulosAgrupadosPorUnidad())
		]

		new Button(top) => [
			caption = "Agrupar por Categoria"
			onClick(|this.modelObject.obtenerArticulosAgrupadosPorCategoria())
		]

	}

}
