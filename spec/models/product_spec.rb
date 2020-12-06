RSpec.describe FlowerShop::Product do

  let(:name) { 'my_product' }
  let(:code) { 'mp' }
  let(:bundle1) { FlowerShop::Bundle.new(5, 599) }
  let(:bundle2) { FlowerShop::Bundle.new(10, 1299) }
  let(:bundles) { [bundle1, bundle2] }

  subject { described_class.new(name, code, bundles) }

  it 'has a name' do
    expect(subject.name).to eq name
  end

  it 'has a code' do
    expect(subject.code).to eq code
  end

  it 'has bundles' do
    expect(subject.bundles).to eq bundles
  end
end
