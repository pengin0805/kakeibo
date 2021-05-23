class VariableCategoryId < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '食費' },
    { id: 3, name: '日用品' },
    { id: 4, name: '交通費' },
    { id: 5, name: '病院' },
    { id: 6, name: '美容院' },
  ]

include ActiveHash::Associations
has_many :variable_costs

end