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
    expect(attributes).to have_key(:datetime)
    expect(attributes).to have_key(:sunrise)
    expect(attributes).to have_key(:sunset)
    expect(attributes).to have_key(:temperature)
    expect(attributes).to have_key(:feels_like)
    expect(attributes).to have_key(:humidity)
    expect(attributes).to have_key(:uvi)
    expect(attributes).to have_key(:visibility)
    expect(attributes).to have_key(:conditions)
    expect(attributes).to have_key(:icon)
    expect(attributes).to_not have_key(:pressure)
    expect(attributes).to_not have_key(:wind_speed)


    expect(attributes).to have_key(:daily_weather)
    expect(attributes).to have_key(:hourly_weather)

  end
end