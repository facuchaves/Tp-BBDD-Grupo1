package conexion

import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Window
import org.uqbar.arena.windows.WindowOwner

class HeladeraWindow extends Window<Object> {

	new(WindowOwner owner, Object model) {
		super(owner, model)
	}

	override createContents(Panel mainPanel) {
		this.title = "Administracion"

		mainPanel.layout = new HorizontalLayout

		new Button(mainPanel) => [
			caption = "Articulos"
			onClick([|(new ArticulosWindow(this,  new Conexion() )).open()])
		]
		new Button(mainPanel) => [
			caption = "Recetas"
			//onClick([|this.multiple()])
		]

	}
	
}
