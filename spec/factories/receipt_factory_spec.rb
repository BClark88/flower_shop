RSpec.describe FlowerShop::ReceiptFactory do
  describe '#print_receipt' do
    subject { described_class.new(product, packaged_bundles).print_receipt }

    describe 'print_receipt' do
      let(:product) { FlowerShop::Product.new('my_product', 'mp', []) }
      let(:bundle1) { FlowerShop::Bundle.new(3, 595) }
      let(:bundle2) { FlowerShop::Bundle.new(5, 995) }
      let(:packaged_bundles) { [bundle1, bundle2, bundle1] }
      let(:expected_output) do
        <<~STRING
        11 mp $21.85
         2 x 3 $5.95
         1 x 5 $9.95
        STRING
      end

      it 'returns a stringio object' do
        expect(subject).to be_a StringIO
      end
      it 'returns the expected output' do
        expect(subject.string).to eq expected_output
      end
    end
  end
end
