module EstimatesHelper
  def estimate_amount(person)
    p person.first_name
    {amount: 100.00, rules_applied: "None"}
  end
end
