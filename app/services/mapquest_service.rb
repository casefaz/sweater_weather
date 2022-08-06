class MapquestService
  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com')
  end

  def self.get_lat_lng(city)
    response = MapquestService.conn.get('/geocoding/v1/address?') do |f|
      f.params['key'] = ENV['MAPQUEST_KEY']
      f.params['location'] = city
    end
    BaseService.get_json(response)
  end
end