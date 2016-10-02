require 'rails_helper'

RSpec.describe Location, type: :model do
  let(:location) { Location.create!(city: "Boston", state: "MA", coast: "east") }

  describe "attributes" do
    it "has condition" do
      expect(location).to have_attributes(city: "Boston", state: "MA", coast: "east")
    end
  end
end
