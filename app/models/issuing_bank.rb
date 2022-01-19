class IssuingBank < ApplicationRecord
  has_many :issuing_bank_parts
  has_many :cards, through: :issuing_bank_parts

  validates :name, presence: true
end
