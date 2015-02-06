require 'bike_container'

class ContainerHolder; include BikeContainer; end #this is an artificial class for test purposes. The only job of this class is to include BikeContainer.

describe BikeContainer do

  let(:bike) { Bike.new }
  let(:holder) { ContainerHolder.new }
  let(:broken_bike){double :Bike, {broken?: true}}

    def fill_holder(holder)
      holder.capacity.times { holder.dock(double :Bike) }
    end

  it 'should accept a bike' do
    holder.dock(bike)
    expect{holder.dock(bike)}.to change{holder.bike_count}.by 1
  end

  it 'should release a bike' do
    holder.dock(bike)
    expect{holder.release(bike)}.to change{holder.bike_count}.by -1
  end

  it 'should know when it\'s full' do
    fill_holder(holder)
    expect(holder).to be_full
  end

  it 'should not accept a bike when it\'s full' do
    fill_holder(holder)
    expect{ holder.dock(bike) }.to raise_error(RuntimeError, 'Sorry! The holder is full!')
  end

  it 'should provide a list of available bikes' do
    holder.dock(bike)
    holder.dock(broken_bike)
    expect(holder.available_bikes).to eq([bike])
  end


end
