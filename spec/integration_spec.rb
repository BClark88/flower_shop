RSpec.describe FlowerShop::ShopService do
  let(:r_12_bundles) { [FlowerShop::Bundle.new(10, 1299), FlowerShop::Bundle.new(5, 699)] }
  let(:l_09_bundles) do
    [FlowerShop::Bundle.new(9, 2495), FlowerShop::Bundle.new(6, 1695), FlowerShop::Bundle.new(3, 995)]
  end
  let(:t_58_bundles) do
    [FlowerShop::Bundle.new(9, 1699), FlowerShop::Bundle.new(5, 995), FlowerShop::Bundle.new(3, 595)]
  end
  let(:r_12_product) { FlowerShop::Product.new('Roses', 'R12', r_12_bundles) }
  let(:l_09_product) { FlowerShop::Product.new('Lilies', 'L09', l_09_bundles) }
  let(:t_58_product) { FlowerShop::Product.new('Tulips', 'T58', t_58_bundles) }
  let(:products) { [r_12_product, l_09_product, t_58_product] }
  let(:input) do
    [
      { code: 'R12', quantity: 10 },
      { code: 'L09', quantity: 15 },
      { code: 'T58', quantity: 13 }
    ]
  end

  let(:expected_output) do
    <<~STRING
      10 R12 $12.99
       1 x 10 $12.99
      15 L09 $41.90
       1 x 6 $16.95
       1 x 9 $24.95
      13 T58 $25.85
       1 x 3 $5.95
       2 x 5 $9.95
    STRING
  end

  subject { described_class.new(products).process_order(input) }

  it 'returns the expected output' do
    expect(subject).to eq expected_output.strip
  end
end
