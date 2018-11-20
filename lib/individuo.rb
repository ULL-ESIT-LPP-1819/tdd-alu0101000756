require "nutrientesEugenio/version"


class Individuo < IMC
    attr_reader :nombre, :paciente, :t_obesidad
    
    def initialize(nombre, paciente, t_obesidad, a, b, c, d)
        @nombre = nombre
        @paciente = paciente
        @t_obesidad = t_obesidad
        if t_obesidad
            super(a,b,c,d)
        end
    end
    
    def cat_peso
        
        if(calcular_imc < 18.5)
            return "Bajo peso"
        elsif(calcular_imc < 24.9)
            return "Saludable"
        elsif(calcular_imc < 29.9)
            return "Sobrepeso"
        elsif(calcular_imc < 39.9)
            return "Obesidad"
        else 
            return "Obesidad Extrema"
        end
            
    end
end