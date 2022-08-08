class RoadTrip
  attr_reader :length

  def initialize(data)
    @length = data[:route][:formattedTime]
  end
end