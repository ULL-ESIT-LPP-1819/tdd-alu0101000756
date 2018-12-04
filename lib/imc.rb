require "nutrientesEugenio/version"
    # Clase con datos nutricionales
    # 
    # @attr_reader [Number] a peso del paciente
    # @attr_reader [Number] b altura del paciente
    # @attr_reader [Number] c edad del paciente
    # @attr_reader [1,0] d sexo del paciente
class IMC
    attr_reader :peso, :altura, :edad, :sexo
    
    # Constructor de un imc
    # 
    # @param [Number] a peso del paciente
    # @param [Number] b altura del paciente
    # @param [Number] c edad del paciente
    # @param [1,0] d sexo del paciente
    #
    # @return [IMC] objeto
    def initialize(a,b,c,d)
        @peso = a
        @altura = b
        @edad = c
        @sexo = d
    end
    # Calcula el imc de un individuo
    #
    # return [Number] imc
    def calcular_imc
        (@peso)/(@altura*@altura)
    end
    # Calcula el %graso
    #
    # return [Number] %graso
    def porcentaje_graso
        (1.2*calcular_imc)+(0.23*@edad)-(10.8*@sexo)-5.4
    end
    # Convierte el objeto a una cadena de caracteres
    #
    # @return [String] devuelve el imc como un string    
    def to_s
        rval = ""
        rval += " pesa #{@peso} kilos , mide #{@altura} metros, tiene #{@edad} años y es"
            if(sexo == 1)
                rval+= " un hombre"
            else
                rval+= " una mujer"
            end
        rval
    end
end