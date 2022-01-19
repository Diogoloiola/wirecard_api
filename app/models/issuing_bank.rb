class IssuingBank < ApplicationRecord
  has_many :cards
  has_many :issuing_banks, through: :issuing_banks
end
