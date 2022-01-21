class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :month

  enum billing_type: {
    boleto: 0,
    credit_card: 1
  }

  def define_payment_day
    actual_date = Time.zone.now

    month = actual_date.strftime('%m').to_i - 1
    year = actual_date.strftime('%Y')

    self.due_date = (actual_date + 1.month).end_of_day
    self.month_id = Month.joins(:year).find_by('year.year': year, month_code: month).id
    self
  end
end
