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
1. Person: Holds the information of the person for whom the policy price is to be estimated.
```
class Person < ActiveRecord::Base
  has_many :estimates
  has_many :person_healths
  GENDER_TYPES = ["female", "male"]
  enum gender: [:female, :male]
end
```
2. PersonHealth

Dependencies |
------------ |
1. Ruby version
*  2.2
2. Rails version
*  4.2.4
3. Gem version
*  2.6.6
4. Configuration
*  Install Rails using this link http://installrails.com/
5. Testing tool
*  RSpec

Deployment instructions |
------------ |
1. Unzip the file and navigate to the /policygenius/insurance folder.
2. Run the following command to install everything in the Gemfile
* bundle install --without production
3. Run the following command to create the database
* rake db:create
4. Run the following command to create the schema tables
* rake db:migrate
5. Run the seed file to populate database with cities.
* rake db:reset

Test the application |
------------ |
1. Start the rails server using the command: rails s
2. Run the RSpec tests located under the /spec folder.
3. Go to http://localhost:3000/ to launch the website.
4. On the home page, click the Get Estimate button.
5. In the Estimate page, enter your information and click the Submit button.
6. You will see a summary page showing the estimated policy price and the rules that were applied to calculate the policy price.
