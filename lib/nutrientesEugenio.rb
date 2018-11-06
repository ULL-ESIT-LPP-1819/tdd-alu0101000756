require "nutrientesEugenio/version"



class Alimento 
    attr_reader :nombre, :grasas, :g_sat, :h_car
      
    def initialize(nombre, grasas, g_sat, h_car)
        @nombre = nombre
        @grasas = grasas
        @g_sat = g_sat
        @h_car = h_car
    end
end

