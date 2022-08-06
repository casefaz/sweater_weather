class MapquestFacade
  def self.get_coordinates(city)
    # binding.pry
    response = MapquestService.get_lat_lng(city)

    Mapquest.new(response)
  end
end