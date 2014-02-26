class RemoveNotUsedFildToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :medical_center, :string
  end
end
