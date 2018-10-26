class Location < ApplicationRecord
  belongs_to :route
  
  geocoded_by :address      
  after_validation :geocode 
end