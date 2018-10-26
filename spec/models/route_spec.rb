require 'rails_helper'

RSpec.describe Route, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:init_address) }
    it { is_expected.to validate_presence_of(:end_address) }
  end
  
  describe "associations" do
    it { is_expected.to belong_to(:journey) }
  end
end
