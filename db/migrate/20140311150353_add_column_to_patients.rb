class AddColumnToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :medical_center_id, :integer
  end
end
