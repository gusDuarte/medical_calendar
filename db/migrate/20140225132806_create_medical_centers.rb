class CreateMedicalCenters < ActiveRecord::Migration
  def change
    create_table :medical_centers do |t|
      t.string :name
      t.string :phone_number
      t.integer :admin_id

      t.timestamps
    end
  end
end
