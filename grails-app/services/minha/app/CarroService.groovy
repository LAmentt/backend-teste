package minha.app

import grails.gorm.transactions.Transactional
import grails.validation.ValidationException

@Transactional
class CarroService {

    Carro get(Serializable id) {
        return Carro.get(id)
    }

    List<Carro> list(Map args) {
        return Carro.list(args)
    }

    Carro salvarCarro(Map dados) {
    Carro carro = new Carro(dados)
    carro.id = null 
    
    
    return carro.save(flush: true, failOnError: true) 
    }

    Carro atualizarCarro(Long id, Map dados) {
    Carro carro = Carro.get(id)
    if (!carro) return null

    carro.properties = dados
    
    
    return carro.save(flush: true, failOnError: true)
    }

    void delete(Serializable id) {
        Carro carro = Carro.get(id)
        if (carro) {
            carro.delete(flush: true)
        }
    }
}