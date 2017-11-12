class Pokemon {

	constructor(_especie) {
		this.tablaNiveles = new TablaNiveles();
		this.experiencia = 1;
		this.especie = _especie;
		this.puntosAtaque = this.especie.puntosAtaque;
		this.entrenador = null;
		this.nombre = "Pikachu Controller";
		this.puntosDeSalud = 1;
		this.puntosSaludMaximo = 1;
	}

	getNivel() {
		return parseInt((Math.pow(100 * (2 * this.experiencia + 25), 0.5) + 50) / 100);
	}

	esFuerteContra(pokemon) {
		return this.especie.esFuerteContra(pokemon);
	}

	esResistente(pokemon) {
		return this.especie.esResistente(pokemon);
	}

	/*
	 * Donde las chances de cada pokémon están definidas por sus puntos de ataque más:
	 * Un 25% (de sus puntos de ataque) adicional si es fuerte respecto al rival
	 * Un 15% (de sus puntos de ataque) adicional si es resistente respecto al rival
	 * Un 20% adicional si entrenador es experto 
	 */
	calcularChancesCombate(pokemon) {

		var porcentaje = this.puntosAtaque;

		if (this.esFuerteContra(pokemon)) {

			porcentaje = porcentaje * 1.25;

		}
		if (this.esResistente(pokemon)) {

			porcentaje = porcentaje * 1.15;

		}
		if (this.entrenador.esExperto) {

			porcentaje = porcentaje * 1.2;

		}

		if (porcentaje != this.puntosAtaque) {
			return porcentaje.toFixed(2);
		} else {
			return porcentaje;
		}
	}

	getTipos() {
		return this.especie.tipo
	}

	static asPokemon(jsonPokemon) {
		return angular.extend(new Pokemon(new Especie()), jsonPokemon)
	}

	getPorcentajeVida() {
		return (this.puntosDeSalud / this.puntosSaludMaximo) * 100;
	}

	getPorcentajeFaltante() {
		return 100 - this.getPorcentajeVida();
	}
	getImgPath() {
		return "img/pokemones/" + this.nombre.toLowerCase() + ".png";
	}
}