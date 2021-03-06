require "nutrientesEugenio/version"

# Representación de un individuo
# 
# @author Eugenio José Gonzalez Luis
# @since 1.0.0
# @attr_reader String nombre Nombre del individuo
# @attr_reader Boolean paciente Determina si el individuo es un paciente o no
# @attr_reader Boolean t_obesidad Determina si el individuo esta recibiendo tratamiendo de obesidad o no
class Individuo < IMC
        include Comparable
    attr_reader :nombre, :paciente, :t_obesidad
    
    # Constructor de un individuo
    # 
    # @param [String] nombre Nombre del individuo
    # @param [Boolean] paciente Determina si el individuo es un paciente o no
    # @param [Boolean] t_obesidad Determina si el individuo esta recibiendo tratamiendo de obesidad o no
    # @param [Number] a peso del paciente
    # @param [Number] b altura del paciente
    # @param [Number] c edad del paciente
    # @param [1,0] d sexo del paciente
    #
    # @return [Individuo] objeto
    def initialize(nombre, paciente, t_obesidad, a, b, c, d)
        @nombre = nombre
        @paciente = paciente
        @t_obesidad = t_obesidad
        if t_obesidad
            super(a,b,c,d)
        end
    end
    
    # Metodo que clasifica individuos segun su imc
    #
    # @return [String] devuelve un string con la clasificación
    def cat_peso
        if(!t_obesidad)
            return "Sin datos recogidos"
        elsif(calcular_imc < 18.5)
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
    # Convierte el objeto a una cadena de caracteres
    #
    # @return [String] devuelve el individuo como un string
    def to_s
        rval = "#{@nombre}"
        if(t_obesidad)
            rval += super
        end
        rval
    end
    # Metodo para comparar dos individuos
    # @param [Individuo] otro individuo a comparar
    #
    # @return [-1,0,1] -1 si es menor, 0 si son iguales, 1 si es mayor
    def <=>(other)
        calcular_imc <=> other.calcular_imc
    end
    
    # Metodo para calcular peso ideal
    #
    # @return [Number] peso ideal del individuo
    def peso_ideal
        ((@altura * 100) - 150) * 0.75 + 50
    end
    
    # Metodo para calcular la tmb
    #
    # @return [Number] tmb del individuo
    def tmb
        10*@peso + ((@altura * 100) * 6.25) - 5 * @edad + 5 + ((1-@sexo) * 166)
    end
    
    # Metodo para calcular el efecto termogeno
    #
    # @return [Number] efecto termogeno del individuo
    def efecto_termogeno
        tmb * 0.1
    end
    
    # Metodo para calcular el gasto de la actividad fisica
    # @param [String] tipo de actividad fisica realizado
    #
    # @return [Number] el gasto de la actividad fisica del individuo
    def gasto_actividad_fisica(cantidad)
        if (cantidad == "reposo")
            return 0
        elsif (cantidad == "ligera")
            return tmb * 0.12
        elsif (cantidad == "moderada")
            return tmb * 0.27
        else
            return tmb * 0.54
        end
    end
    
    # Metodo para calcular el gasto total del individuo
    # @param [String] tipo de actividad fisica realizado
    #
    # @return [Number] el gasto total del individuo del individuo
    def gasto_energetico_total(cantidad)
        tmb + efecto_termogeno + gasto_actividad_fisica(cantidad)
    end
    
end