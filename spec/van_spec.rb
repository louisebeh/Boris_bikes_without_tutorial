require 'van'

describe Van do

  let(:van) { Van.new }
  let(:bike) {double :Bike, broken?: false}
  let(:broken_bike){double :Bike, {broken?: true}}
  let(:station) {double :DockingStation, bikes: [broken_bike, broken_bike, broken_bike, bike]}

  it 'should accept broken bikes from a station' do
    expect(station).to receive :release_broken_bikes
    station.release_broken_bikes
  end

#   it 'should collect broken bikes from a station' do
#     van.dock(station.release_broken_bikes)
#     expect(van.bike_count).to eq(3)
#   end

#   it 'should release broken bikes' do
#     van.dock(broken_bike)
#     expect{van.release(broken_bike)}.to change{van.bike_count}.by -1
#   end


end


