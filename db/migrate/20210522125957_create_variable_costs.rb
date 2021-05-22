class CreateVariableCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :variable_costs do |t|
      t.integer    :variable_category_id,   null: false
      t.string     :variable_name,          null: false
      t.integer    :price,               null: false
      t.date       :date,               null: false
      t.timestamps
    end
  end
end
