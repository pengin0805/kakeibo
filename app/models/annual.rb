class Annual < ApplicationRecord
  belongs_to :specate

  with_options presence: true do
    validates :special_name
    validates :price
    validates :date
  end
  with_options numericality: { other_than: 1 } do
    validates :specate_id
  end
end
