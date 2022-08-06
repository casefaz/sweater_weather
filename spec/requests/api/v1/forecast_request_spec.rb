require 'rails_helper'

RSpec.describe 'Forecast API'do 
  it 'sends the forecast based on a city' do
    city = 'denver,co'
    get "api/v1/forecast?location=#{city}"

    expect(response).to be_successful
    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(forecast).to have_key(:data)
    expect(forecast[:data]).to have_key(:id)
    expect(forecast[:data][:id]).to eq(nil)
    expect(forecast[:data]).to have_key(:type)
    expect(forecast[:data][:type]).to eq('forecast')
    expect(forecast[:data]).to have_key(:attributes)

    attributes = forecast[:data][:attributes]

    expect(attributes).to have_key(:current_weather)
    expect(attributes[:current_weather]).to have_key(:datetime)
    expect(attributes[:current_weather][:datetime]).to be_a(String)
    expect(attributes[:current_weather]).to have_key(:sunrise)
    expect(attributes[:current_weather][:sunrise]).to be_a(String)
    expect(attributes[:current_weather]).to have_key(:sunset)
    expect(attributes[:current_weather][:sunset]).to be_a(String)
    expect(attributes[:current_weather]).to have_key(:temperature)
    expect(attributes[:current_weather]).to have_key(:feels_like)
    expect(attributes[:current_weather]).to have_key(:humidity)
    expect(attributes[:current_weather]).to have_key(:uvi)
    expect(attributes[:current_weather]).to have_key(:visibility)
    expect(attributes[:current_weather]).to have_key(:conditions)
    expect(attributes[:current_weather]).to have_key(:icon)
    expect(attributes[:current_weather]).to_not have_key(:pressure)
    expect(attributes[:current_weather]).to_not have_key(:wind_speed)


    expect(attributes).to have_key(:daily_weather)
    expect(attributes[:daily_weather].first).to have_key(:date)
    expect(attributes[:daily_weather].first).to have_key(:sunrise)
    expect(attributes[:daily_weather].first).to have_key(:sunset)
    expect(attributes[:daily_weather].first).to have_key(:max_temp)
    expect(attributes[:daily_weather].first).to have_key(:min_temp)
    expect(attributes[:daily_weather].first).to have_key(:conditions)
    expect(attributes[:daily_weather].first).to have_key(:icon)
    expect(attributes[:daily_weather].first).to_not have_key(:wind_speed)
    expect(attributes[:daily_weather].first).to_not have_key(:wind_gust)
    expect(attributes[:daily_weather].first).to_not have_key(:clouds)
    
    expect(attributes).to have_key(:hourly_weather)
    expect(attributes[:hourly_weather].first).to have_key(:time)
    expect(attributes[:hourly_weather].first).to have_key(:temperature)
    expect(attributes[:hourly_weather].first).to have_key(:conditions)
    expect(attributes[:hourly_weather].first).to have_key(:icon)
    expect(attributes[:hourly_weather].first).to_not have_key(:feels_like)
    expect(attributes[:hourly_weather].first).to_not have_key(:wind_gust)
    expect(attributes[:hourly_weather].first).to_not have_key(:dew_point)
    expect(attributes[:hourly_weather].first).to_not have_key(:pressure)
  end
end