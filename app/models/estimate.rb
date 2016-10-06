class Estimate < ActiveRecord::Base
  belongs_to :person
  BASE_COST = 100.00
  MINIMUM_AGE = 18
  AGE_INCREMENT = 5
  AGE_PRICE_INCREMENT = 20.00
  GEOGRAPHIC_DISCOUNT_PERCENT = 5
  GENDER_DISCOUNT = 12.00
  HEALTH = {:"allergies" => 1, :"sleep apnea" => 6, :"heart disease" => 17, :"high cholesterol" => 8, :"asthma" => 4 }

  def self.health_keys
    HEALTH.keys
  end

end
