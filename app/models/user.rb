class User < ApplicationRecord
  has_many :cards
  has_many :payments

  validates_presence_of :name, :email, :cpf
end
