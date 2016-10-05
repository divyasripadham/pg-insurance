require 'rails_helper'

RSpec.describe EstimatesController, type: :controller do

  describe "GET #show" do
    my_location = Location.create!(city: 'Seattle',state: 'WA',coast: 1)
    my_person = Person.create!(first_name: "Brad", age: 20, gender: "male", location: my_location)
    my_estimate = Estimate.create!(person: my_person, amount: 100.00, rules_applied: "The base cost of insurance is $100 annually.")
    it "returns http success" do
      get :show, {id: my_estimate.id}
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
      get :show, {id: my_estimate.id}
      expect(response).to render_template :show
    end
    it "assigns my_post to @post" do
      get :show, {id: my_estimate.id}
      expect(assigns(:estimate)).to eq(my_estimate)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end
    it "instantiates @estimate" do
      get :new
      expect(assigns(:estimate)).not_to be_nil
    end
  end

  describe "POST #create" do
    my_location1 = Location.create!(city: 'Boston',state: 'MA',coast: 0)
    my_location2 = Location.create!(city: 'Seattle',state: 'WA',coast: 1)

    it "applies pricing rules for female on east coast with age increment" do
      post :create, {person: {first_name: "Kelly", age: 50, gender: "female", location: my_location1}}
      expect(assigns(:estimate)).to have_attributes(amount: 197.00, rules_applied: "The base cost of insurance is $100 annually. For every 5 years over the age of 18 years old, the base price increases by 20.0. If on the East Coast of America, the cost is 5% lower. Females have a longer life expectancy, so receive a $12.0 discount on the final price.")
    end

    it "applies pricing rules for male on west coast with no age increment" do
      post :create, {person: {first_name: "Brad", age: 20, gender: "male", location: my_location2}}
      expect(assigns(:estimate)).to have_attributes(amount: 100.00, rules_applied: "The base cost of insurance is $100 annually.")
    end

    it "redirects to the new estimate" do
      post :create, {person: {first_name: "Brad", age: 20, gender: "male", location: my_location2}}
      expect(response).to redirect_to Estimate.last
    end
  end

end
