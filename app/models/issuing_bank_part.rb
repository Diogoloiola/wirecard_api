class IssuingBankPart < ApplicationRecord
  belongs_to :card
  belongs_to :issuing_bank
  validates :balance, presence: true
end
