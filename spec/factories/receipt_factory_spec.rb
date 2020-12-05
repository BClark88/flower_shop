require_relative '../../factories/receipt_factory'

RSpec.describe ReceiptFactory do
  describe '#print_receipt' do
    subject { described_class.new(product, packaged_bundles) }

    describe 'print_receipt' do
      let(:product) { Product.new('my_product', 'mp', []) }
      let(:bundle1) { Bundle.new(3, 595) }
      let(:bundle2) { Bundle.new(5, 995) }
      let(:packaged_bundles) { [bundle1, bundle2, bundle1] }
      let(:expected_output) do
        "11 mp $21.85\n" \
        " 2 x 3 $5.95\n" \
        ' 1 x 5 $9.95'
      end
      it 'returns the expected output' do
        expect(subject.print_receipt).to eq expected_output
      end
    end
  end
end
