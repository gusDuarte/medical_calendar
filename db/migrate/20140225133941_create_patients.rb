class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.integer :center_id

      t.timestamps
    end
  end
end
