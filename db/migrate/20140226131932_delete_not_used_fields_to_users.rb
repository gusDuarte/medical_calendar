class DeleteNotUsedFieldsToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :center_id, :medical_center
  end
end
