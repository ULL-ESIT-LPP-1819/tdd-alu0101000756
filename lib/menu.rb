require "nutrientesEugenio/version"


# Representación de un Menu dietetico
# 
# @author Eugenio Jose Gonzalez Luis
# @since 1.0.0
class Menu < Lista
    include Comparable
    # metodo que calcula el coste calorico de un menu
    #
    # @return [Number] Coste calorico del menu
    def kcal
        x = collect{|a| a.kcal}
        y = x.inject(0, :+)
        y
    end
    
    # metodo que calcula si un menu es suficiente para un individuo dado
    # @param [Individuo] persona persona para la cual se calcula si es suficiente
    # @param [cantidad] cantidad de ejercicio que esa persona realiza
    #
    # @return [Boolean] devuelve si el menú es o no suficiente para una persona
    def is_enough(persona, cantidad)
        x = kcal
        return (persona.gasto_energetico_total(cantidad) <= x * 1.1) && (persona.gasto_energetico_total(cantidad) >= x * 0.9)
    end
    # Metodo para comparar dos menus
    # @param [Individuo] otro menu a comparar
    #
    # @return [-1,0,1] -1 si es menor, 0 si son iguales, 1 si es mayor
    def <=>(other)
        kcal <=> other.kcal
    end
end