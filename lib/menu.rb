require "nutrientesEugenio/version"


# Representación de un Menu dietetico
# 
# @author Eugenio Jose Gonzalez Luis
# @since 1.0.0
class Menu < Lista
    
    def kcal
        x = collect{|a| a.kcal}
        y = x.inject(0, :+)
        y
    end
    
    def is_enough(persona, cantidad)
        x = kcal
        return (persona.gasto_energetico_total(cantidad) <= x * 1.1) && (persona.gasto_energetico_total(cantidad) >= x * 0.9)
    end
end