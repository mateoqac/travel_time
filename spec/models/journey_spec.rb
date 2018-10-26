require 'rails_helper'

RSpec.describe Journey, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:leaving_date) }
    it { is_expected.to validate_presence_of(:leaving_time) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to have_many(:routes) }
  end


  describe "Adding routes" do

    it "Add a route" do
      journey = create(:journey)
      journey.add_route

      expect(journey.routes.length).to be(1)
    end

    it "First route added should depart from the office" do
      journey = create(:journey)
      journey.add_route

      expect(journey.routes.first.init_address).to eq(ENV['OFFICE_ADDRESS'])
    end
  end

end
