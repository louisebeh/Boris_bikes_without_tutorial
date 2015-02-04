require 'docking_station'

describe DockingStation do

  let(:bike){double :Bike, {broken?: false}}
  let(:broken_bike){double :Bike, {broken?: true}}
  let(:station){DockingStation.new(capacity: 20)}

    def fill_station(station)
      20.times { station.dock(double :Bike) }
    end


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
    fill_station station
    expect{ station.dock(bike) }.to raise_error(RuntimeError, 'Station is full')
    #Lambda: allows us to save a block of code as a variable
  end

  it 'should provide a list of available bikes' do #we now need to think about bike & DockingStation simultaneously
    station.dock(bike)
    station.dock(broken_bike)
    expect(station.available_bikes).to eq([bike])
  end


end