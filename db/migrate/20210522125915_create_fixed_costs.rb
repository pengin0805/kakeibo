class CreateFixedCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :fixed_costs do |t|
      t.integer    :fixed_category_id,   null: false
      t.integer    :fixed_id,            null: false
      t.integer    :price,               null: false
      t.date       :month,               null: false
      t.timestamps
    end
  end
end
