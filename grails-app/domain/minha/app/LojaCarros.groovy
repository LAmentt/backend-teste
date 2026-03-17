package minha.app

class LojaCarros {

    String nome
    String cnpj
    
    
    static hasMany = [carros: Carro]

    static constraints = {

        nome nullable: false, blank: false
        cnpj nullable: false, blank: false, unique: true
    }

    static mapping = {
        version false
    }
}
