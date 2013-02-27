module TavtExpress
  class Application < Rails::Application
    config.after_initialize do
      all_vin_numbers = Car.all.map do |car|
        car.vin  
      end
      Car.fuzzy_vin = FuzzyMatch.new(all_vin_numbers)
    end
  end
end
