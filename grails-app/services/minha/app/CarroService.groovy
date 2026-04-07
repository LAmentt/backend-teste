package minha.app

import grails.gorm.transactions.Transactional
import grails.validation.ValidationException

@Transactional
class CarroService {

    static final List<String> CORES_VALIDAS = [
        "branco", "preto", "prata", "cinza", "vermelho",
        "azul", "amarelo", "verde", "laranja", "marrom",
        "bege", "roxo", "rosa", "dourado", "vinho"
    ]

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

    Map formatarErros(def errors) {
        def listaErros = errors.allErrors.collect { error ->
            String mensagem
            switch(error.field) {
                case 'cor':
                    mensagem = "Cor '${error.rejectedValue}' inválida. Cores aceitas: ${CORES_VALIDAS.join(', ')}"
                    break
                case 'marca':
                    mensagem = "Marca '${error.rejectedValue}' não permitida."
                    break
                default:
                    mensagem = "Erro no campo ${error.field}: valor inválido."
            }
            return [campo: error.field, valor: error.rejectedValue, orientacao: mensagem]
        }
        return [erros: listaErros]
    }
}