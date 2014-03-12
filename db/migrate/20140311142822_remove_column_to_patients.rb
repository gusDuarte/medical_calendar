class RemoveColumnToPatients < ActiveRecord::Migration
  def change
    remove_column :patients, :center_id, :integer
  end
end
