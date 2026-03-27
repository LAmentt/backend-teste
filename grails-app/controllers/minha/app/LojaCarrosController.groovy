package minha.app
import grails.converters.JSON
class LojaCarrosController {

    def save() { 
        LojaCarros loja = new LojaCarros(request.JSON as Map)
        if(loja.save(flush: true)){
          render loja as JSON
        }
        else{
            response.status = 422
            render loja.errors as JSON
        }
    }
    def index(){
        render LojaCarros.list() as JSON
    }

}
