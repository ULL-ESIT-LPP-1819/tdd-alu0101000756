class IMC
    attr_reader :peso, :altura, :edad, :sexo
    
    def initialize(a,b,c,d)
        @peso = a
        @altura = b
        @edad = c
        @sexo = d
    end
    
    def calcular_imc
        (@peso)/(@altura*@altura)
    end
    
    def porcentaje_graso
        (1.2*calcular_imc)+(0.23*@edad)-(10.8*@sexo)-5.4
    end
        
end