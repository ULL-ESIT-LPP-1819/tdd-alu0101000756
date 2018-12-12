require "nutrientesEugenio/version"


# Representación de un Menu dietetico
# 
# @author Eugenio Jose Gonzalez Luis
# @since 1.0.0
class Menu < Lista
    
    def is_enough(persona, cantidad)
        x = collect{|a| a.kcal}
        y = x.inject(0, :+)
        return (persona.gasto_energetico_total(cantidad) <= y * 1.1) && (persona.gasto_energetico_total(cantidad) >= y * 0.9)
    end
end