class PagesController < ApplicationController
  include ActionView::Helpers::NumberHelper

  def car_lookup
  end

  def search
    vin = Car.fuzzy_vin.find(params[:vin]) 
    car = Car.find_by_vin(vin)

    respond_to do |format|
      format.json {
        render :json => {
          vin: car.vin.gsub('*', '-'),
          make: car.make,
          model: car.model,
          year: car.year,
          value: number_to_currency(car.value),
          vid: car.vid,
          trim: car.trim.gsub('*','-')
        }
      }
    end
  end

  def home
  end

  def pricing
  end

end
