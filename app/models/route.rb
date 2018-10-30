class Route < ApplicationRecord
  require 'exceptions'

  belongs_to :journey

  belongs_to :init_location, :class_name => 'Location', optional: true
  belongs_to :end_location, :class_name => 'Location', optional: true

  accepts_nested_attributes_for :init_location, allow_destroy: true, reject_if:  ->(attrs) { attrs['address'].blank?}
  accepts_nested_attributes_for :end_location, allow_destroy: true, reject_if:  ->(attrs) { attrs['address'].blank?}  
  before_save :calculate_arrival_time


  private
  def calculate_arrival_time
    response = ApplicationController.helpers.get_request_to_json('/api/1/traveltime/',
      {'startcoord': self.init_location.to_geo,
        'endcoord': self.end_location.to_geo,
        'time': self.journey.leaving_time})
    if response.code === 200
      mins = JSON.parse(response.to_json)['travel_time_minutes']
      self.arrival_time = self.journey.get_init_time + mins.minutes
      binding.pry
    else
      raise Exceptions::ThirdPartyAPIError.new
    end
  end
end
