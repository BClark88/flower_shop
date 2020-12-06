require_relative '../../models/bundle'
RSpec.describe Bundle do

  subject { described_class.new(5, 599) }

  it 'has a quantity' do
    expect(subject.quantity).to eq 5
  end

  it 'has a price' do
    expect(subject.price).to eq 599
  end
end
