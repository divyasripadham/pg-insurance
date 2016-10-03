class Person < ActiveRecord::Base
  serialize :health, Hash
  has_many :estimates
  has_many :person_healths
  GENDER_TYPES = ["female", "male"]
  enum gender: [:female, :male]
end
