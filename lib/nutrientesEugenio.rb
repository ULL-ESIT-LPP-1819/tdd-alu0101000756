require "nutrientesEugenio/version"



class Alimento 
    attr_reader :nombre, :grasas, :g_sat, :h_car, :azucar
      
    def initialize(nombre, grasas, g_sat, h_car, azucar)
        @nombre = nombre
        @grasas = grasas
        @g_sat = g_sat
        @h_car = h_car
        @azucar = azucar
    end
end

