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
    @person_health = PersonHealth.new
  end

  def create
    @person = Person.new
    @person.first_name = params[:person][:first_name]
    @person.age = params[:person][:age]
    @person.gender = params[:person][:gender]
    @person.location = params[:person][:location]

    if params[:person_health][:condition]
      params[:person_health][:condition].each do |condition|
        if !(condition == "")
          @person.person_healths.build(:condition => condition)
        end
      end
    end

    @person.save

    @estimate = Estimate.new
    @estimate.person = @person
    estimated_amount = estimate_amount(@person)
    @estimate.amount = estimated_amount[:amount]
    @estimate.rules_applied = estimated_amount[:rules_applied]

    if @estimate.save
      redirect_to @estimate
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end

  end
end
