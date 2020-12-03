require_relative '../../services/calculator_service'

RSpec.describe CalculatorService do

  let(:bundle1) { Bundle.new(3, 595) }
  let(:bundle2) { Bundle.new(5, 995) }
  let(:bundle3) { Bundle.new(9, 1699) }
  let(:bundles) { [bundle1, bundle2, bundle3] }

  subject { described_class.new }

  context 'can calculate, quantity bigger than largest bundle' do
    let(:expected_combination) { [bundle1, bundle2, bundle2] }
    it 'returns the expected output' do
      expect(subject.calculate(13, bundles)).to eq expected_combination
    end
  end

  context 'can calculate, quantity smaller than largest bundle' do
    let(:expected_combination) { [bundle1, bundle1] }
    it 'returns the expected output' do
      expect(subject.calculate(6, bundles)).to eq expected_combination
    end
  end

  context 'can calculate, one pack only' do
    let(:expected_combination) { [bundle1] }
    it 'returns the expected output' do
      expect(subject.calculate(3, bundles)).to eq expected_combination
    end
  end

  context 'zero quantity' do
    it 'returns an empty array' do
      expect(subject.calculate(0, bundles)).to eq []
    end
  end
  context 'negative number' do
    it 'returns an empty array' do
      expect(subject.calculate(-1, bundles)).to eq []
    end
  end

  context 'cannot calculate' do
    it 'returns an empty array' do
      expect(subject.calculate(7, bundles)).to eq []
    end
  end
end
