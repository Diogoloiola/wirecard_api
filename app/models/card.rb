class Card < ApplicationRecord
  belongs_to :user
  belongs_to :issuing_bank
  validates_presence_of :holder_name, :number, :expiration, :cvv

  def check_limit(amount)
    define_new_limit

    (balance - amount).negative?
  end

  def register_transaction(amount)
    self.balance -= amount
  end

  private

  def define_new_limit
    return unless Time.zone.now > invoice_due_date

    self.invoice_due_date = invoice_due_date + 1.month
    self.balance = fixed_balance
  end
end
