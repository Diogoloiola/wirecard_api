class Month < ApplicationRecord
  belongs_to :year

  has_many :payments

  validates :month_code, presence: true

  enum month_code: {
    janeiro: 0,
    feveriro: 1,
    março: 2,
    abril: 3,
    maio: 4,
    junho: 5,
    julho: 6,
    agosto: 7,
    setembro: 8,
    outubro: 9,
    novembro: 10,
    dezembro: 11
  }
end
