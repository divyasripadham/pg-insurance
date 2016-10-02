require 'rails_helper'

RSpec.describe Person, type: :model do
  let(:person) { Person.create!(first_name: "Martha", age: 34, gender: "male", location: "Boston") }

  describe "attributes" do
     it "has first_name, age, gender and location attributes" do
       expect(person).to have_attributes(first_name: "Martha", age: 34, gender: "male", location: "Boston")
     end
   end
end
