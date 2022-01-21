class Year < ApplicationRecord
  has_many :months, dependent: :destroy
end
