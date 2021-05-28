class SpecialCost < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :special_category

  with_options presence: true do
    validates :special_name
    validates :price
    validates :date
  end
  with_options numericality: { other_than: 1 } do
    validates :special_category_id
  end

end
