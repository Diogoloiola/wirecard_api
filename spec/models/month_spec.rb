require 'rails_helper'

RSpec.describe Month, type: :model do
  it { should validate_presence_of(:month_code) } 
end
