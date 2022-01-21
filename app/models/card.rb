class Card < ApplicationRecord
  belongs_to :user
  belongs_to :issuing_bank
  validates_presence_of :holder_name, :number, :expiration, :cvv
end
