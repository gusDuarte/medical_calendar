class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :event_id
      t.integer :medical_center_id
      t.integer :doctor_id
      t.integer :patient_id

      t.timestamps
    end
  end
end
