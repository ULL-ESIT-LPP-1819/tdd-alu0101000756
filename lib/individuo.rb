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
end