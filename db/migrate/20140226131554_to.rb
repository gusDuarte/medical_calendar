class To < ActiveRecord::Migration
  def change
    add_column :users, :medical_center_id, :integer
  end
end
