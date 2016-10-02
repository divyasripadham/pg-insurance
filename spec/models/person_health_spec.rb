require 'rails_helper'

RSpec.describe PersonHealth, type: :model do
  let(:person) { Person.create!(first_name: "Martha", age: 34, gender: "male", location: "Boston") }
  let(:person_health) {person.person_healths.create!(condition: "Allergies")}

  it { is_expected.to belong_to(:person) }
  describe "attributes" do
    it "has condition" do
      expect(person_health).to have_attributes(condition: "Allergies")
    end
  end
end
