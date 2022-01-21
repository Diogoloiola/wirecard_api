class User < ApplicationRecord
  has_many :cards, dependent: :destroy
  has_many :payments, dependent: :destroy

  validates_presence_of :name, :email, :cpf
end
