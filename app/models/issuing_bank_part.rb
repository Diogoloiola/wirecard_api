class IssuingBankPart < ApplicationRecord
  belongs_to :card
  belongs_to :issuing_bank
end
