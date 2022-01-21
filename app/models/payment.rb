class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :month

  after_initialize :set_due_date
  after_initialize :set_payment_month

  enum billing_type: {
    boleto: 0,
    credit_card: 1
  }

  def set_due_date
    self.due_date = (Time.zone.now + 1.month).end_of_day
  end

  def set_payment_month
    month = Time.zone.now.strftime('%m').to_i - 1
    year = Time.zone.now.strftime('%Y')

    self.month_id = Month.joins(:year).find_by('year.year': year, month_code: month).id
  end
end
