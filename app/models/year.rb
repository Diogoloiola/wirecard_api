class Year < ApplicationRecord
  has_many :months, dependent: :destroy
  validates :year, presence: true

  def self.create_year_and_months
    year = Year.create!(year: Time.zone.now.strftime('%Y'))
    12.times do |month_code|
      Month.create!(month_code: month_code, year_id: year.id)
    end
  end
end
