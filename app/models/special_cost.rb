class SpecialCost < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :special_category_id

end
