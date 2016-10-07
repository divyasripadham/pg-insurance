This is a pricing engine that prints out the estimated policy price for a given person.

User Stories |
------------ |
As a user, I want to navigate to the home page that has a link to the estimate page.
As a developer, I want to create the required models.
As a user, I want to navigate to the estimate page from the home page.
As a user I want to submit my information on the estimate page and move to a summary page.
As a developer, I want to create a helper to calculate the policy price based on rules.
As a user, I want to receive the estimated policy price based on the information I submitted.

* Ruby version
ruby 2.2

* Rails version
ruby 4.2.4

* System dependencies

* Configuration
Install Rails using this link http://installrails.com/

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
1. Unzip
2. Run the following command to install everything in the Gemfile
bundle install --without production
3. Run the following command to create the database
rake db:create
4. Run the following command to create the schema tables
rake db:migrate
5. Run the seed file to populate database with cities.
rake db:reset

* ...
