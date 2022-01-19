class Card < ApplicationRecord
  has_many :issuing_bank_parts
  has_many :issuing_banks, through: :issuing_banks
  belongs_to :user
end
