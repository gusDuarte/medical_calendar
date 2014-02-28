class AddMedicalCenterIdToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :medical_center_id, :integer
    remove_column :doctors, :center_id, :integer
  end
end
