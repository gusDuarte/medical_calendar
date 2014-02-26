require 'spec_helper'

describe MedicalCenter do
 
  before { @mc = MedicalCenter.new(name: "Centro Medico", address: "Artigas 12345", phone_number: "12345678") }

  subject { @mc }

  it { should respond_to(:name) }
  it { should respond_to(:address) }
  it { should respond_to(:phone_number) }


  describe "when name and phone number are already taken" do
    before do
      mc_dup = @mc.dup
      mc_dup.name = @mc.name.upcase
      mc_dup.phone_number = @mc.phone_number
      mc_dup.save
    end
    it { should_not be_valid }
  end

end
