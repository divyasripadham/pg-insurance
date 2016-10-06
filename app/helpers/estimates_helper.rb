module EstimatesHelper
  def east_coast?(location)
    Location.find(location).east?
  end

  def estimate_amount(person)
    final_amount = Estimate::BASE_COST
    rules_applied_desc = "The base cost of insurance is $100 annually."
    if person.age < Estimate::MINIMUM_AGE
      final_amount = 0
      rules_applied_desc = "Life insurance is only available for people over the age of #{Estimate::MINIMUM_AGE}."
    else
      if ((person.age - Estimate::MINIMUM_AGE) >= Estimate::AGE_INCREMENT)
        final_amount += ((person.age - Estimate::MINIMUM_AGE)/Estimate::AGE_INCREMENT).floor * Estimate::AGE_PRICE_INCREMENT
        p ((person.age - Estimate::MINIMUM_AGE)/Estimate::AGE_INCREMENT).floor * Estimate::AGE_PRICE_INCREMENT
        rules_applied_desc += " For every #{Estimate::AGE_INCREMENT} years over the age of #{Estimate::MINIMUM_AGE} years old, the base price increases by #{Estimate::AGE_PRICE_INCREMENT}."
      end
      p "age increment"
      p final_amount
      if east_coast?(person.location)
        final_amount = final_amount*(1-(Estimate::GEOGRAPHIC_DISCOUNT_PERCENT.to_f/100))
        rules_applied_desc += " If on the East Coast of America, the cost is #{Estimate::GEOGRAPHIC_DISCOUNT_PERCENT}% lower."
      end

      p final_amount
      if person.person_healths
        person.person_healths.each do |x|
          health_percent = Estimate::HEALTH[x.condition.to_sym]
          final_amount = final_amount*(1+(health_percent.to_f/100))
          p final_amount
          rules_applied_desc += " #{health_percent}% applied for #{x.condition}."
        end
      end

      p final_amount
      if person.female?
        final_amount = final_amount - Estimate::GENDER_DISCOUNT
        rules_applied_desc += " Females have a longer life expectancy, so receive a $#{Estimate::GENDER_DISCOUNT} discount on the final price."
      end
    end

    {amount: final_amount, rules_applied: rules_applied_desc}
  end
end
