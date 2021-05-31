class FixedCost < ApplicationRecord
  belongs_to :fixecate
  belongs_to :fixecate_name

  with_options presence: true do
    validates :price
    validates :month
  end
  with_options numericality: { other_than: 1 } do
    validates :fixecate_id
    validates :fixecate_name_id
  end
end
