class Year < ApplicationRecord
  has_many :months, dependent: :destroy
  validates :year, presence: true
end
