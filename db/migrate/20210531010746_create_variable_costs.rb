class CreateVariableCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :variable_costs do |t|
      t.references    :varicate,   foreign_key: true
      t.string     :variable_name,          null: false
      t.integer    :price,                  null: false
      t.date       :start_time,             null: false
      t.string       :card,             null: false
      t.timestamps
    end
  end
end
