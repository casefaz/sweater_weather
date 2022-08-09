require 'rails_helper'

RSpec.describe RoadTrip do 
  it 'exists and has attributes' do 
    data = {
      "route": {
          "hasTollRoad": true,
          "hasBridge": true,
          "boundingBox": {
              "lr": {
                  "lng": -87.632401,
                  "lat": 39.73687
              },
              "ul": {
                  "lng": -105.010361,
                  "lat": 41.883228
              }
          },
          "distance": 1006.473,
          "hasTimedRestriction": false,
          "hasTunnel": false,
          "hasHighway": true,
          "computedWaypoints": [],
          "routeError": {
              "errorCode": -400,
              "message": ""
          },
          "formattedTime": "14:24:27"
        }
      }
    trip = RoadTrip.new('Denver', 'Chicago', data)
    # binding.pry
    expect(trip).to be_an_instance_of(RoadTrip)
    expect(trip.travel_time).to eq("14:24:27")
    expect(trip.origin).to eq('Denver')
    expect(trip.destination).to eq('Chicago')
  end
end