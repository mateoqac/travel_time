require 'faker'

FactoryGirl.define do
  factory :route do
    init_address Faker::Address.full_address
    end_address Faker::Address.full_address
  end
end
