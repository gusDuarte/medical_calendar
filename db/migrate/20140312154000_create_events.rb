class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.datetime :starts_at
      t.datetime :end_at
      t.boolean :all_day

      t.timestamps
    end
  end
end
