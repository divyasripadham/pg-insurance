This is a pricing engine that prints out the estimated policy price for a given person.

User Stories |
------------ |
1. As a user, I want to navigate to the home page that has a link to the estimate page.
2. As a developer, I want to create the required models.
3. As a user, from the home page I want to navigate to the estimate page and submit my information.
4. As a developer, I want to create a helper to calculate the policy price based on user information.
5. As a user, once I submit my information on the estimate page, I want to see the estimated price in a summary page.

Design Decisions |
------------ |
* Person model: Holds the information of the person for whom the policy price is to be estimated.

```
class Person < ActiveRecord::Base
  has_many :estimates
  has_many :person_healths
  GENDER_TYPES = ["female", "male"]
  enum gender: [:female, :male]
end
```

* PersonHealth model: Holds health condition information for each Person. Since each Person can have multiple health conditions (one-to-many relationship), each Person record can have multiple PersonHealth records. This is a better design than storing all the health conditions in the Person model.

```
class PersonHealth < ActiveRecord::Base
  belongs_to :person
end
```

* Location model: Holds the names of all cities in the US. It also indicates whether a city is in the east coast or west coast. This can be extended to include other geographic conditions.

```
class Location < ActiveRecord::Base
  enum coast: [:east, :west]
end
```

* Estimate model: Used to store the estimated policy price and rules applied for each Person. Each Person has an Estimate. This model also has the constants required to apply the rules to calculate the policy price. Any changes in policy rules can be made easily by updating the constants in this model.

```
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
```

* WelcomeController controller: Used to show the home page. Uses view welcome>index.html

* EstimatesController controller: Used to collect Person information, create a new estimate for that Person and calculate the estimated policy price. Uses views estimates>new.html and estimates>show.html

* EstimatesHelper helper: Used by EstimatesController to calculate estimated policy price.

Dependencies |
------------ |
1. Ruby version:
2.2
2. Rails version:
4.2.4
3. Gem version:
2.6.6
4. Configuration:
Install Rails using this link http://installrails.com/
5. Testing tool:
RSpec

Deployment instructions |
------------ |
1. Unzip the file and navigate to the /policygenius/insurance folder.
2. Run the following command to install everything in the Gemfile.
bundle install --without production
3. Run the following command to create the database.
rake db:create
4. Run the following command to create the schema tables.
rake db:migrate
5. Run the seed file to populate database with cities.
rake db:reset

Test the application |
------------ |
1. Start the rails server using the command: rails s
2. Run the RSpec tests located under the /spec folder.
3. Go to http://localhost:3000/ to launch the website.
4. On the home page, click the Get Estimate button.
5. In the Estimate page, enter Person information and click the Submit button.
6. You will see a summary page showing the estimated policy price and the rules that were applied to calculate the policy price.
7. Click the Get Another Estimate button to calculate policy price for new Person information.
