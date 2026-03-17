package minha.app

class BootStrap {

    def init = { servletContext ->
    if (LojaCarros.count() == 0){
        println "Banco vazio! Criando loja inicial..."
        new LojaCarros("Concessionária Floripa").save(failOnError: true)

       }
       else{
        println "loja já existe no banco. Pulando criação."
       }
    }
    def destroy = {
    }
}
