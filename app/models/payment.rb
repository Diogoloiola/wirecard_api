class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :month
  before_create :set_due_date
  after_save :set_payment_month

  enum billing_type: {
    boleto: 0,
    credit_card: 1
  }

  def set_due_date
    self.due_date = Time.zone.now + 1.month
  end

  def set_payment_month
    month = Time.zone.now.strftime('%m')
    year = Time.zone.now.strftime('%Y')

    self.month_id = Month.find_by(month_id: month - 1, year: year).id
  end
end
