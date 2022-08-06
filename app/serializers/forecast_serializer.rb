class ForecastSerializer
  include JSONAPI::Serializer
  set_id { nil }
  set_type :forecast
  attributes :current_weather, :hourly_weather, :daily_weather
end
