class Payment < ApplicationRecord
  belongs_to :user

  before_create :set_due

  enum billing_type: {
    boleto: 0,
    credit_card: 1
  }

  def set_due
    self.due_date = Time.zone.now + 1.month
  end
end
