class Api::V1::RoadTripController < ApplicationController
  def create
    # binding.pry
    if params[:api_key] != "" && !params[:api_key].nil?
      coordinates = MapquestFacade.get_coordinates(params[:destination])
      eta = TripWeatherFacade.get_arrival_weather(coordinates.lat, coordinates.lon, params[:origin], params[:destination])
      render json: TripWeatherSerializer.get_arrival_weather(eta)
    else
      render status: 401
    end 
  end
end
