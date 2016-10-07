require 'rails_helper'
include EstimatesHelper

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
    my_location3 = Location.create!(city: 'New York',state: 'NY',coast: 0)
    my_location4 = Location.create!(city: 'San Francisco',state: 'CA',coast: 1)
    my_location5 = Location.create!(city: 'Los Angeles',state: 'CA',coast: 1)

    it "applies pricing rules for female on east coast with age increment and one health condition" do
      post :create, {person: {first_name: "Kelly", age: 50, gender: "female", location: my_location1}, person_health: {condition: ["allergies"]}}
      expect(assigns(:estimate)).to have_attributes(amount: 199.09)
    end

    it "applies pricing rules for male on west coast with age increment and one health condition" do
      post :create, {person: {first_name: "Josh", age: 40, gender: "male", location: my_location2}, person_health: {condition: ["sleep apnea"]}}
      expect(assigns(:estimate)).to have_attributes(amount: 190.8)
    end

    it "applies pricing rules for female on east coast with age increment and multiple health conditions" do
      post :create, {person: {first_name: "Jan", age: 30, gender: "female", location: my_location3}, person_health: {condition: ["heart disease", "high cholesterol"]}}
      expect(assigns(:estimate)).to have_attributes(amount: 154.25)
    end

    it "applies pricing rules for male on west coast with no age increment or health condition" do
      post :create, {person: {first_name: "Brad", age: 20, gender: "male", location: my_location4}, person_health: {}}
      expect(assigns(:estimate)).to have_attributes(amount: 100.00)
    end

    it "applies pricing rules for male on west coast under 18 with health condition" do
      post :create, {person: {first_name: "Petr", age: 10, gender: "male", location: my_location5}, person_health: {condition: ["asthma"]}}
      expect(assigns(:estimate)).to have_attributes(amount: 0.00, rules_applied: "Life insurance is only available for people over the age of 18.")
    end

    it "redirects to the new estimate" do
      post :create, {person: {first_name: "Kelly", age: 50, gender: "female", location: my_location1}, person_health: {condition: ["allergies"]}}
      expect(response).to redirect_to Estimate.last
    end
  end

end
