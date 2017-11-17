package conexion

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import modelo.RecetaModelo
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.List
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.NumericField

class RecetasWindow extends TransactionalDialog<RecetaModelo> {

	new(WindowOwner parent, RecetaModelo model) {
		super(parent, model)

	}

	override protected createFormPanel(Panel mainPanel) {
		this.title = "Recetas"
		
		var Panel title= new Panel(mainPanel).layout = new HorizontalLayout
		new Label(title).text = "RECETAS"
		
		var Panel main= new Panel(mainPanel).layout = new HorizontalLayout
				
		var Panel left = new Panel(main).layout = new VerticalLayout
		new Label(left).text = "Titulo: "
		new TextBox(left) => [
		    value <=> "titulo"
		    width = 200 
		]
		new Label(left).text = "Descripcion: "
		new TextBox(left) => [
		    value <=> "descripcion"
		    width = 200
		]
		new Label(left).text = "Pasos: "
		new TextBox(left) => [
		    value <=> "pasos"
		    height = 150
		    width = 200 
		]
		
		var Panel center = new Panel(main).layout = new VerticalLayout
		new Label(center).text = "Listado de artículos: "
	    new List(center) => [
	            items <=> "articulosListados"
	            value <=> "articuloSeleccionado"
	            width = 200
	            height = 100
	    ]
	    new Label(center).text = "Artículos de la receta: "
		new List(center) => [
	            items <=> "articulosAgregados"
	            width = 200
	            height = 100
	    ]
	    
	    var Panel right = new Panel(main).layout = new VerticalLayout
//		new Label(right).text = "Categoria: "
//	    new List(right) => [
//	            items <=> "categoriaSeleccionada"
//	            width = 100
//	    ]
//	    new Label(right).text = "Unidad: "
//		new List(right) => [
//	            items <=> "unidadSeleccionada"
//	            width = 100
//	    ]
	    new Label(right).text = "Stock: "
		new NumericField(right) => [
		    value <=> "stock"
		    width = 100
		]
	    
		
		var Panel bottom = new Panel(mainPanel).layout = new HorizontalLayout
		new Button(bottom) => [
			caption = "Agregar artículo a la receta"
			onClick(|this.modelObject.agregarArticulo())
		]
		new Button(bottom) => [
			caption = "Instanciar receta"
			onClick(|this.modelObject.instanciarReceta())
		]

	}

}
