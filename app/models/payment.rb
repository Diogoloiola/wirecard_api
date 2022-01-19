class Payment < ApplicationRecord
  belongs_to :user

  enum billing_type: {
    boleto: 0,
    credit_card: 1
  }
end