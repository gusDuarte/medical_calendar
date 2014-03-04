class RemoveColumnsToDoctors < ActiveRecord::Migration
  def change
    remove_column :doctors, :center_id, :string
    remove_column :doctors, :password_digest, :string
  end
end
