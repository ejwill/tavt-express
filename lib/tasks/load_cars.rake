require './lib/manual.rb'

task :load_cars => :environment do
  manual = Manual.new()
  manual.extract_data(80) 

  Car.import manual.cars
end
