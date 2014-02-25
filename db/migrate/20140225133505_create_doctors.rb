class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :password_digest
      t.integer :center_id

      t.timestamps
    end
  end
end
