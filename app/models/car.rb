class Car < ActiveRecord::Base
  attr_accessible :make, :model, :trim, :value, :vid, :vin, :year, :id

  # Store all of the vin numbers in memory so that 
  # we can access them later using fuzzy_search
  class << self
    attr_accessor :fuzzy_vin 
  end

end
