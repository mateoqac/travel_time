require 'ffaker'

FactoryGirl.define do
  factory :journey do
    leaving_time FFaker::Time.between(DateTime.now - 1, DateTime.now).strftime('%H:%M')
    leaving_date FFaker::Time.between(DateTime.now - 1, DateTime.now).strftime('%Y-%m-%d')
    name FFaker::Name.name
  end
end
