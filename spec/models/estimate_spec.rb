require 'rails_helper'

RSpec.describe Estimate, type: :model do
  let(:person) { Person.create!(first_name: "Martha", age: 34, gender: "male", location: "Chicago") }
  let(:estimate) { Estimate.create!(rules_applied: "None", amount: 100.00) }

  it { is_expected.to belong_to(:person) }
  describe "attributes" do
    it "has amount and rules" do
      expect(estimate).to have_attributes(rules_applied: "None", amount: 100.00)
    end
  end

end
