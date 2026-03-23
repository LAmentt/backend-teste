package minha.app

class BootStrap {

    def init = { servletContext ->
    if (LojaCarros.count() == 0){
        println "Banco vazio! Criando loja inicial..."
        new LojaCarros(nome: "Concessionária Floripa", cnpj: "02.667.108/0001-68").save(failOnError: true)

       }
       else{
        println "loja já existe no banco. Pulando criação."
       }
    }
    def destroy = {
    }
}
