require 'ffaker'

FactoryGirl.define do
  factory :route do
    init_location FactoryGirl.create(:location)
    end_location FactoryGirl.create(:location)
  end
end
