class Location < ActiveRecord::Base
  enum coast: [:east, :west]
end
