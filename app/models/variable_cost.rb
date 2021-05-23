class VariableCost < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :variable_category_id
end
