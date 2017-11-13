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

class RecetasWindow extends TransactionalDialog<RecetaModelo> {

	new(WindowOwner parent, RecetaModelo model) {
		super(parent, model)

	}

	override protected createFormPanel(Panel mainPanel) {
		this.title = "Recetas"

		var Panel top = new Panel(mainPanel).layout = new VerticalLayout
		new Label(top).text = "Titulo: "
		new TextBox(top) => [
		    value <=> "titulo"
		    width = 200 
		]
		
		new Label(top).text = "Descripcion: "
		new TextBox(top) => [
		    value <=> "descripcion"
		    width = 200 
		]
		
		new Label(top).text = "Pasos: "
		new TextBox(top) => [
		    value <=> "pasos"
		    width = 200 
		]
		
		new Button(top) => [
			caption = "Instanciar receta"
			onClick(|this.modelObject.instanciarReceta())
		]

	}

}
