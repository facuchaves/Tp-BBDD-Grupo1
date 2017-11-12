package conexion

import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window

class MainApplication extends Application {
	
	new() {
		super()
	}
	
	static def void main(String[] args) { 
		new MainApplication().start()
	}

	override protected Window<?> createMainWindow() {
		return new HeladeraWindow(this, new PruebaArticulo())
	}
	
}
