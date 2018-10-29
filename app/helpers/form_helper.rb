module FormHelper
  def setup_journey(journey)
    journey.routes.build if journey.routes.empty?
    journey.routes.first.init_location = Location.new(address: ENV['OFFICE_ADDRESS'])
    journey.routes.first.end_location = Location.new
    journey
  end  
end