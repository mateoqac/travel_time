require 'ffaker'

FactoryGirl.define do
  factory :location do
    address FFaker::AddressUK.street_address
    latitude FFaker::Geolocation.lat
    longitude FFaker::Geolocation.lng
  end
end
