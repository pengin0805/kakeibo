class VariableCost < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :variable_category

  with_options presence: true do
    validates :variable_name
    validates :price
    validates :date
  end
  with_options numericality: { other_than: 1 } do
    validates :variable_category_id
  end

end
