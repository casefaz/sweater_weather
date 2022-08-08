class Api::V1::MunchiesController < ApplicationController
  def index
    # binding.pry
    city = MapquestFacade.get_coordinates(params[:location])
    forecast = ForecastFacade.forecast(city.lat, city.lon)
    type = 
    render json: MunchiesSerializer.locate_restaurants(params[:location], params[:food], forecast)
  end
end