require 'faker'

FactoryGirl.define do
  factory :journey do
    leaving_time Faker::Time.between(DateTime.now - 1, DateTime.now).strftime('%H:%M')
    leaving_date Faker::Time.between(DateTime.now - 1, DateTime.now).strftime('%Y-%m-%d')
    name Faker::Name.name
  end
end
