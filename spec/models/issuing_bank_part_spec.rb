require 'rails_helper'

RSpec.describe IssuingBankPart, type: :model do
  it { should validate_presence_of(:balance) }
end
