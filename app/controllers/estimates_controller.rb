class EstimatesController < ApplicationController

  include EstimatesHelper

  def index
  end

  def show
    @estimate = Estimate.find(params[:id])
  end

  def new
    @estimate = Estimate.new
    @person = Person.new
  end

  def create
    @person = Person.new
    @person.first_name = params[:person][:first_name]
    @person.age = params[:person][:age]
    @person.gender = params[:person][:gender]
    @person.location = params[:person][:location]
    @person.save

    @estimate = Estimate.new
    @estimate.person = @person
    @estimate.amount = estimate_amount(@person)[:amount]
    @estimate.rules_applied = estimate_amount(@person)[:rules_applied]

    if @estimate.save
      redirect_to @estimate
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end

  end
end
