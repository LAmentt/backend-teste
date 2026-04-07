package minha.app

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class CarroController {

    CarroService carroService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        render carroService.list(params) as JSON
    }

    def show(Long id) {
        Carro carro = carroService.get(id)
        if (!carro) {
            render(status: 404, [erro: "Carro não encontrado"] as JSON)
            return
        }
        render carro as JSON
    }

    def save() {
        try {
            Carro carro = carroService.salvarCarro(request.JSON as Map)
            render carro as JSON
        }
        catch (ValidationException e) {
            response.status = 422
            render carroService.formatarErros(e.errors) as JSON 
        }
        catch (Exception e) {
            response.status = 500
            render([erro: "Erro interno no servidor"] as JSON)
        }
    }

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
            render carroService.formatarErros(e.errors) as JSON
        }
        catch (Exception e) {
            response.status = 500
            render([erro: "Erro ao atualizar: ${e.message}"] as JSON)
        }
    }

    def delete(Long id) {
        carroService.delete(id)
        render status: NO_CONTENT
    }
}