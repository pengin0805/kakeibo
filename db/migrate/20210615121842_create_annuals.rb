class CreateAnnuals < ActiveRecord::Migration[6.0]
  def change
    create_table :annuals do |t|
      t.integer    :specate_id,   null: false
      t.string     :special_name,          null: false
      t.integer    :price,               null: false
      t.date       :date,               null: false
      t.timestamps
    end
  end
end
