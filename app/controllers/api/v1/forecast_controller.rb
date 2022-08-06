class Api::V1::ForecastController < ApplicationController 
  def show
    binding.pry
    location = MapquestFacade.get_lat_long(params[:location])
  end
end