describe Van do

  let(:bike) { Bike.new }
  let(:station) { DockingStation.new }

  context 'Upon creation' do
    it 'is empty' do
      expect(subject.bikes.length).to eq 0
    end
    it 'has a capacity of 4' do
      expect(subject.capacity).to eq 4
    end
  end

  context 'Can collect from the stations' do
    it 'only broken bikes' do
      bike.break
      station.add_bike(bike)
      3.times { station.add_bike(Bike.new) }
      subject.collect_broken(station)
      expect(subject.bikes.length).to eq 1
    end
    it 'and reports if there are no broken bikes' do
      3.times { station.add_bike(Bike.new) }
      expect { subject.collect_broken(station) }.to raise_error 'No broken bikes'
    end
  end

  context 'Can unload' do
    it 'broken bikes at the garage' do
      3.times do
        bike = Bike.new
        bike.break
        station.add_bike(bike)
      end
      subject.collect_broken(station)
      subject.unload
      expect(subject.bikes).to eq []
    end
    it 'working bikes at the station' do
      3.times { subject.bikes << Bike.new }
      station.load_from(subject)
      expect(subject.bikes).to eq []
    end
  end

  context 'Can load working bikes' do

    let(:garage) { Garage.new }

    it 'that have been fixed in the garage' do
      3.times do
        bike = Bike.new
        bike.break
        garage.bikes << bike
      end
      garage.fix_all
      subject.load_from(garage)
      expect(subject.bikes.length).to eq 3
    end
  end

  context 'Cannot unload' do
    it 'if van is empty' do
      expect { subject.unload }.to raise_error 'Van is empty'
    end
  end
end