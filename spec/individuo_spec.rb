require "spec_helper"

RSpec.describe Individuo do
  before :each do
      @j = Individuo.new("Eugenio", false, true, 73, 1.82, 25, 1)
  end
  it "has a version number" do
    expect(Individuo::VERSION).not_to be nil
  end
  
    context "Individuo" do
        it "Tiene los atributos necesarios" do
            expect(@j).to have_attributes(:nombre => "Eugenio", :paciente => false, :t_obesidad => true, :peso => 73, :altura => 1.82, :edad => 25, :sexo => 1)
        end
     
    end
end