class WeatherService
  def self.conn
    Faraday.new(url: 'https://api.openweathermap.org')
  end

  def self.get_weather(lat, long)
    response = WeatherService.conn.get('/data/2.5/onecall?') do |f|
      f.params['appid'] = ENV['WEATHER_KEY']
      f.params['lat'] = lat
      f.params['lon'] = long
      f.params['units'] = 'imperial'
    end
    # binding.pry
    BaseService.get_json(response)
    # binding.pry
  end
end