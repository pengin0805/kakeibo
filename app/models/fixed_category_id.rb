class FixedCategoryId < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '住宅費' },
    { id: 3, name: '光熱水費' },
    { id: 4, name: '通信費' },
    { id: 5, name: '保険料' },
    { id: 6, name: 'その他,娯楽' },
  ]

include ActiveHash::Associations
has_many :fixed_costs

end