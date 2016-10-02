class Person < ActiveRecord::Base
  serialize :health, Hash
  has_many :estimates
  has_many :person_healths
  enum gender: [:female, :male]
end
