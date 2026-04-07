package minha.app

class Carro {

String cor
Integer qtPorta
Integer quantEstoque
String tpMotor
String modelo
String marca
BigDecimal preco
String placa

    static belongsTo = [loja: LojaCarros]


    static List<String> MARCAS_VALIDAS = ['Ford', 'Toyota', 'Volkswagen', 'Honda', 'Fiat', 'Chevrolet', 
    'Porsche', 'Ferrari', 'Hyundai', 'Lamboghini', 'Tesla', 'Peugeot', 'Renault', 'Citroen', 
    'Mitsubishi', 'Subaru', 'Suzuki', 'Mazda', 'Lexus', 'BYD', 'Nissan']
    
    
    static constraints = {
         cor nullable: false, blank: false, validator: { valor, obj ->
            if (!CORES_VALIDAS.contains(valor?.toLowerCase())) {
                return "Cor inválida. Cores permitidas: ${CORES_VALIDAS.join(', ')}"
            }
            return true
        }


         marca nullable: false, validator: {valor, obj ->
           if (!MARCAS_VALIDAS.contains(valor)){
             return "marca.invalida. Marcas permitidas: ${MARCAS_VALIDAS.join(', ')}"
           }
           return true   
        }

             
        qtPorta min: 2, max: 6
        tpMotor inList: ['Gasolina','Diesel','Eletrico','Hibrido']
        modelo nullable: false
        preco nullable: false, min: 5000.0 , max: 1000000000.0, scale: 2
        loja nullable: false
        placa unique: true, blank: false, maxSize: 7 
       }

       static List<String> CORES_VALIDAS=[
         "branco","preto","prata", "cinza", "vermelho", "azul", "azul-marinho", "amarelo", "verde",
        "laranja", "marrom", "bege","roxo", "rosa","dourado", "vinho", "musgo"]
    
        static mapping = {

        version false
    }
}

