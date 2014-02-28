class RemovePasswordDigestToDoctors < ActiveRecord::Migration
  def change
    remove_column :doctors, :password_digest, :string
  end
end
