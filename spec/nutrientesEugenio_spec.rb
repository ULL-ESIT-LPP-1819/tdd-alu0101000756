RSpec.describe NutrientesEugenio do
  it "has a version number" do
    expect(NutrientesEugenio::VERSION).not_to be nil
  end
  
  before :all do
    @manzana = NutrientesEugenio.new("manzana", 10, 10, 10)
    @pera = NutrientesEugenio.new("pera", 1, 2, 3)
  end

  it "does something useful" do
    expect(true).to eq(true)
  end
  
   context "Elementos básicos del alimento" do
    it "Tiene el atributo nombre" do
      expect(@manzana).to have_attributes(:nombre => "manzana")
    end
    it "Tiene un método para obtener el nombre" do
      expect(@manzana.nombre).to eq("manzana")
    end
  end
  
  
end
