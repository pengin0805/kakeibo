class CreateFixecateNames < ActiveRecord::Migration[6.0]
  def change
    create_table :fixecate_names do |t|
      t.string     :name,          null: false
      t.timestamps
    end
  end
end
