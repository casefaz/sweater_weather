class Api::V1::ForecastController < ApplicationController 
  def show
    location = MapquestFacade.get_coordinates(params[:location])
    weather = ForecastFacade.forecast(location.lat, location.lon)
    render json: ForecastSerializer.new(weather)
  end
end