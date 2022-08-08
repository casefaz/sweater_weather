class BusinessFacade
  def self.find_restaurants(city, type)
    businesses = YelpService.get_restaurants(city, type)
    # binding.pr
    businesses[:businesses].map do |business_data|
      Business.new(business_data)
    end
  end
end