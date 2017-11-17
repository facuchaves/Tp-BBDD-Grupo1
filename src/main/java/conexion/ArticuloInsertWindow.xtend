package conexion

import modelo.ArticuloInsertModelo
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.TextBox
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.operator_spaceship
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout

class ArticuloInsertWindow extends TransactionalDialog<ArticuloInsertModelo> {

	new(WindowOwner parent, ArticuloInsertModelo model) {
		super(parent, model)

	}

	override protected createFormPanel(Panel mainPanel) {
		this.title = "Insertar Nuevo Artículo"

		var Panel top = new Panel(mainPanel).layout = new VerticalLayout
		
		var Panel nombre = new Panel(top).layout = new HorizontalLayout
		new Label(top).text = "Nombre: "
		new TextBox(nombre) => [
		    value <=> "nombre"
		    width = 200 
		]
		
		var Panel cant_stock = new Panel(top).layout = new HorizontalLayout
		new Label(cant_stock).text = "Stock: "
		new TextBox(cant_stock) => [
		    value <=> "cant_stock"
		    width = 200
		]
		
		var Panel descripcion = new Panel(top).layout = new HorizontalLayout
		new Label(descripcion).text = "Descripcion: "
		new TextBox(descripcion) => [
		    value <=> "descripcion"
		    width = 200
		]
		
		var Panel categoria = new Panel(top).layout = new HorizontalLayout
		new Label(categoria).text = "Categoría: "
	    new List(categoria) => [
	            items <=> "categorias"
	            value <=> "categoriaSeleccionada"
	            width = 200
	            height = 100
	    ]

		var Panel unidad = new Panel(top).layout = new HorizontalLayout
		new Label(unidad).text = "Artículos: "
	    new List(unidad) => [
	            items <=> "unidades"
	            value <=> "unidadSeleccionada"
	            width = 200
	            height = 100
	    ]		

		var Panel bottom = new Panel(mainPanel).layout = new HorizontalLayout
		new Button(bottom) => [
			caption = "Agregar artículo"
			onClick(|this.modelObject.insertarArticulo())
		]

	}

}
