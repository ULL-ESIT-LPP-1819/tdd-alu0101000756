require "nutrientesEugenio/version"



class Alimento 
    attr_reader :nombre, :grasas, :g_sat
      
    def initialize(nombre, grasas, g_sat)
        @nombre = nombre
        @grasas = grasas
        @g_sat = g_sat
    end
end

