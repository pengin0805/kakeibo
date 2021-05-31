class CreateFixedCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :fixed_costs do |t|
      t.references    :fixecate,   foreign_key: true
      t.references    :fixecate_name,   foreign_key: true
      t.integer    :price,               null: false
      t.date       :month,               null: false
      t.timestamps
    end
  end
end
