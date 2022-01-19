require 'rails_helper'

RSpec.describe Card, type: :model do
  it { should validate_presence_of(:holder_name) }
  it { should validate_presence_of(:number) }
  it { should validate_presence_of(:expiration) }
  it { should validate_presence_of(:cvv) }
  it { should have_many(:issuing_bank_parts) }
  it { should have_many(:issuing_banks).through(:issuing_bank_parts) }
end
