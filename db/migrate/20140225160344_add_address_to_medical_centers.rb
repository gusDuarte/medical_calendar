class AddAddressToMedicalCenters < ActiveRecord::Migration
  def change
    add_column :medical_centers, :address, :string
  end
end
