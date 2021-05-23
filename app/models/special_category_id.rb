class SpecialCategoryId < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '税金' },
    { id: 3, name: 'お祝い' },
    { id: 4, name: 'その他、娯楽' },
  ]

include ActiveHash::Associations
has_many :special_costs

end