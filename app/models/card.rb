class Card < ApplicationRecord
  has_one :issuing_bank_part
  has_many :issuing_banks, through: :issuing_bank_parts
  belongs_to :user

  validates_presence_of :holder_name, :number, :expiration, :cvv
end
