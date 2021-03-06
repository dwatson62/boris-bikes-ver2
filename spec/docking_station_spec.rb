describe DockingStation do

  let(:bike) { double(Bike.new) }

  context 'Upon creation' do
    it 'is empty' do
      expect(subject.bikes).to eq []
    end
    it 'has capacity of 4' do
      expect(subject.capacity).to eq 4
    end
  end

  context 'can receive' do
    it 'a working bike' do
      subject.add_bike(bike)
      expect(subject.bikes).to eq [bike]
    end
    it 'a broken bike' do
      allow(bike).to receive(:working) { false }
      allow(bike).to receive(:break) { true }
      bike.break
      subject.add_bike(bike)
      expect(bike.working).to be_falsey
    end
  end

  context 'cannot receive a bike' do
    it 'when capacity has been reached' do
      4.times { subject.add_bike(bike) }
      expect { subject.add_bike(bike) }.to raise_error 'DockingStation is full'
    end
  end

  context 'Member of the public accesses the station and it' do

    before(:each) do
      allow(bike).to receive(:working) { true }
    end

    it 'releases a working bike' do
      subject.add_bike(bike)
      subject.release_bike
      expect(bike.working).to be_truthy
    end
    it 'releases one working bike at a time' do
      4.times { subject.add_bike(Bike.new) }
      subject.release_bike
      expect(subject.bikes.length).to eq 3
    end
    it 'does not release the broken bike' do
      subject.add_bike(bike)
      bike2 = Bike.new
      bike2.break
      subject.add_bike(bike2)
      bike = subject.release_bike
      expect(bike.working).to be_truthy
    end
  end

  context 'The station reports itself empty' do
    it 'when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'DockingStation is empty'
    end
    it 'when there are no working bikes available' do
      allow(bike).to receive(:working) { false }
      allow(bike).to receive(:break) { true }
      bike.break
      subject.add_bike(bike)
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end
end