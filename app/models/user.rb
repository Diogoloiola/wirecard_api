class User < ApplicationRecord
  has_many :cards
  has_many :payments
end
