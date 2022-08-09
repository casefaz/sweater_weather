class RoadTrip
  attr_reader :travel_time,
              :origin,
              :destination

  def initialize(origin, destination, data)
    @travel_time = data[:route][:formattedTime]
    @origin = origin
    @destination = destination
  end
end