class Api::V1::MunchiesController < ApplicationController
  def index
    # binding.pry
    if params[:location] != nil && params[:food] != nil
      city = MapquestFacade.get_coordinates(params[:location])
      forecast = ForecastFacade.forecast(city.lat, city.lon)
      restaurant =  BusinessFacade.find_restaurants(params[:location], params[:food])
      render json: MunchiesSerializer.locate_restaurants(params[:location], restaurant, forecast)
    else
      render json: {error: user.errors.full_messages.to_sentence}, status: 400
    end 
  end
end