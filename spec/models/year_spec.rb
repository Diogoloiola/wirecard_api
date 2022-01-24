require 'rails_helper'

RSpec.describe Year, type: :model do
  it { should validate_presence_of(:year) }
  it { should have_many(:months) }
end
