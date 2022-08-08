class RoadTripFacade
  def self.get_length(origin, destination)
    roadtrip = MapquestService.get_travel_info(origin, destination)
    RoadTrip.new(roadtrip)
  end
end