class YelpService
  def self.conn
    url = "https://api.yelp.com"
    Faraday.new(url: url)
  end

  def self.get_restaurants(city, type)
    response = YelpService.conn.get('/v3/businesses/search') do |f|
      f.headers['Authorization'] = ENV['YELP KEY']
      f.params['term'] = type
      f.params['location'] = city
    end
    BaseService.get_json(response)
  end
end