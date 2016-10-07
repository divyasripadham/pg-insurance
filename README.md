This is a pricing engine that prints out the estimated policy price for a given person.

User Stories |
------------ |
As a user, I want to navigate to the home page that has a link to the estimate page.
As a developer, I want to create the required models.
As a user, from the home page I want to navigate to the estimate page and submit my information.
As a developer, I want to create a helper to calculate the policy price based on user information.
As a user, once I submit my information on the estimate page, I want to see the estimated price in a summary page.

Dependencies |
------------ |
* Ruby version
ruby 2.2

* Rails version
ruby 4.2.4

* Gem version
2.6.6

* Configuration
Install Rails using this link http://installrails.com/

Deployment instructions |
------------ |
1. Unzip the file
2. Run the following command to install everything in the Gemfile
bundle install --without production
3. Run the following command to create the database
rake db:create
4. Run the following command to create the schema tables
rake db:migrate
5. Run the seed file to populate database with cities.
rake db:reset

Test the application |
------------ |
1. Start the rails server using the command:
rails s
2. Run the RSpec tests located under the /spec folder.
3. Go to http://localhost:3000/ to launch the website.
4. On the home page, click the Get Estimate button.
5. In the Estimate page, enter your information and click the Submit button.
6. You will see a summary page showing the estimated policy price and the rules that were applied to calculate the policy price.
