require 'bike'

describe Bike do
  context 'On creation' do
    it 'Bike is working' do
      expect(subject.working).to be_truthy
    end
  end

  context 'can be reported' do
    it 'as broken' do
      subject.break
      expect(subject.working).to be_falsey
    end
  end
end