require_relative '../../services/calculator_service'

RSpec.describe CalculatorService do

  subject { described_class.new }
  context 'can calculate' do
    it 'returns the expected output' do
      expect(subject.calculate(13, packs)).to eq 2585
    end
  end

  context 'zero quantity' do
    it 'returns zero' do
      expect(subject.calculate(-1, packs)).to eq 0
    end
  end
  context 'negative number' do
    it 'returns nil' do
      expect(subject.calculate(-1, packs)).to eq nil
    end
  end

  context 'cannot calculate' do
    it 'returns nil' do
      expect(subject.calculate(7, packs)).to eq nil
    end
  end
end
