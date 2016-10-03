class EstimatesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @estimate = Estimate.new
    @person = Person.new
  end

  def create
    # @estimate = Estimate.new(estimate_params)
    # @person = Person.new(person_params)
    p params[:person][:location]
    @person = Person.new
    @person.first_name = params[:person][:first_name]
    @person.age = params[:person][:age]
    @person.gender = params[:person][:gender]
    @person.location = params[:person][:location]
  end
end
