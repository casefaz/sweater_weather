class Api::V1::MunchiesController < ApplicationController
  def index
    # binding.pry
    if params[:location].blank?
      render json: { status: 'ERROR', message: 'Invalid Location', data: {} }, status: 400
    else
      city = MapquestFacade.get_coordinates(params[:location])
      forecast = ForecastFacade.forecast(city.lat, city.lon)
      restaurant =  BusinessFacade.find_restaurants(params[:location], params[:food])
      render json: MunchiesSerializer.locate_restaurants(params[:location], restaurant, forecast)
    end 
  end
end