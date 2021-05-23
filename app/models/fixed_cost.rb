class FixedCost < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :fixed_category_id
  belongs_to :fixed_id

  with_options presence: true do
    validates :price
    validates :month
  end
  with_options numericality: { other_than: 1 } do
    validates :fixed_category_id
    validates :fixed_id
  end

end
