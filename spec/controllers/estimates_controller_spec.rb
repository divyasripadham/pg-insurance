require 'rails_helper'

RSpec.describe EstimatesController, type: :controller do
  let(:my_person) { Person.create!(first_name: "Brad", age: 20, gender: "male", location: "San Francisco") }
  let(:my_estimate) { Estimate.create!(person: my_person, amount: 100.00, rules_applied: "None") }

  describe "GET #show" do
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
    it "assigns the new estimate to @estimate" do
      post :create, {person: {first_name: "Brad", age: 20, gender: "male", location: "San Francisco"}, estimate: {amount: 100.00, rules_applied: "None"}}
      expect(assigns(:estimate)).to eq Estimate.last
    end
    it "redirects to the new estimate" do
      post :create, {person: {first_name: "Brad", age: 20, gender: "male", location: "San Francisco"}, estimate: {amount: 100.00, rules_applied: "None"}}
      expect(response).to redirect_to Estimate.last
    end
  end

end
