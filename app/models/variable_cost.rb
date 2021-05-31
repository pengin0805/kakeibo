class VariableCost < ApplicationRecord
  belongs_to :varicate

  with_options presence: true do
    validates :variable_name
    validates :price
    validates :start_time
  end
  with_options numericality: { other_than: 1 } do
    validates :varicate_id
  end
end
