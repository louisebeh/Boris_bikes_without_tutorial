require 'docking_station'

describe DockingStation do
  let(:bike){Bike.new}
  let(:station){DockingStation.new(capacity: 20)}

  it 'should accept a bike' do
    expect{station.dock(bike)}.to change{station.bike_count}.by 1
  end

  it 'should release a bike' do
    station.dock(bike)
    expect{station.release(bike)}.to change{station.bike_count}.by -1

  end

  it 'should know when it\'s full' do
    20.times {station.dock(bike)}
    expect(station).to be_full
  end

  it 'should not accept a bike when it\'s full' do
    20.times {station.dock(bike)}
    expect{station.dock(bike)}.to raise_error 'Station is full'
    #Lambda: allows us to save a block of code as a variable
  end


end