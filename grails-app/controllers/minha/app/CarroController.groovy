package minha.app

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class CarroController {

    CarroService carroService

    static final List<String> CORES_VALIDAS = [
        "branco", "preto", "prata", "cinza", "vermelho",
        "azul", "amarelo", "verde", "laranja", "marrom",
        "bege", "roxo", "rosa", "dourado", "vinho"
    ]

    // Listar
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        render carroService.list(params) as JSON
    }

    // Mostrar um
    def show(Long id) {
        Carro carro = carroService.get(id)
        if (!carro) {
            render(status: 404, [erro: "Carro não encontrado"] as JSON)
            return
        }
        render carro as JSON
    }

    // Salvar
    def save() {
        try {
            Carro carro = carroService.salvarCarro(request.JSON as Map)
            render carro as JSON
        }
         catch (grails.validation.ValidationException e) {
            response.status = 422
            render formatarErros(e.errors) as JSON 
        }
        catch (Exception e) {
            response.status = 500
            render([erro: "Erro interno: ${e.message}"] as JSON)
        }
    }

    // Atualizar
    def update(Long id) {
        try {
            Carro carro = carroService.atualizarCarro(id, request.JSON as Map)
            if (!carro) {
                render(status: 404, [erro: "Carro não encontrado"] as JSON)
                return
            }
            render carro as JSON
        } catch (ValidationException e) {
            response.status = 422
            render formatarErros(e.errors) as JSON
        }
    }

    def delete(Long id) {
        carroService.delete(id)
        render status: NO_CONTENT
    }

   private Map formatarErros(def errors) {
    def listaErros = errors.allErrors.collect { error ->
        String mensagem
        
        switch(error.field) {
            case 'cor':
                mensagem = "Cor '${error.rejectedValue}' inválida. Cores aceitas: ${CORES_VALIDAS.join(', ')}"
                break
                
            case 'marca':
                mensagem = "Marca '${error.rejectedValue}' não permitida. Verifique a ortografia."
                break
                
            case 'loja':
                mensagem = "A loja deve ser um objeto com ID existente. Exemplo: {'id': 5}"
                break
                
            case 'qtPorta':
                mensagem = "Quantidade de portas (${error.rejectedValue}) inválida. Use entre 2 e 5."
                break
                
            default:
                mensagem = "Erro no campo ${error.field}: verifique o valor enviado."
        }
        
        return [
            campo: error.field,
            valorEnviado: error.rejectedValue,
            orientacao: mensagem
        ]
    }
    
    return [erros: listaErros]
}

}