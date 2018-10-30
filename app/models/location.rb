class Location < ApplicationRecord
  validates :address, presence: true

  geocoded_by :address      
  after_validation :geocode 

  def to_geo
    [self.latitude, self.longitude].join(',')
  end
end