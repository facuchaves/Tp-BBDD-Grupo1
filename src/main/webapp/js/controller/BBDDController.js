
class BBDDController{
    constructor(){
        this.articulos = []
        this.getArticulos()
    }


    getArticulos(){
        this.$http.get('http://localhost:9000/heladera/articulos').then( function(data) {
            this.articulos = data;
        })
    }
}