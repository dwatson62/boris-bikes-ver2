describe Garage do
  context 'Upon creation' do
    it 'is empty' do
      expect(subject.bikes).to eq []
    end
    it 'has a capacity of 4' do
      expect(subject.capacity).to eq 4
    end
  end

  context 'can receive' do
    it 'broken bikes from the van' do
      van = Van.new
      3.times do
        bike = Bike.new
        bike.break
        van.bikes << bike
      end
      subject.load_from(van)
      expect(subject.bikes.length).to eq 3
    end
  end

  context 'can fix' do
    it 'all broken bikes' do
      bike = Bike.new
      bike.break
      subject.bikes << bike
      subject.fix_all
      expect(bike.working).to be_truthy
    end
  end

  context 'is empty' do
    it 'when garage collects all working bikes' do
      van = Van.new
      bike = Bike.new
      bike.break
      subject.bikes << bike
      subject.fix_all
      van.load_from(subject)
      expect(subject.bikes.length).to eq 0
    end
  end

  context 'cannot fix' do
    it 'if the garage is empty' do
      expect { subject.fix_all }.to raise_error 'Garage is empty'
    end
  end
end