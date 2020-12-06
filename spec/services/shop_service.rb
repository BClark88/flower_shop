RSpec.describe FlowerShop::ShopService do
  let(:receipt_factory) { instance_double(FlowerShop::ReceiptFactory) }
  let(:calculator_service) { instance_double(FlowerShop::CalculatorService) }
  let(:bundle) { FlowerShop::Bundle.new(1, 100) }
  let(:expected_output) { 'My receipt' }
  let(:combination) { double }
  let(:code) { 'mp' }
  let(:quantity) { 1 }
  let(:input) { [{ code: code, quantity: quantity }] }
  let(:products) { [FlowerShop::Product.new('My Product', code, [bundle])] }
  let(:receipt) { StringIO.new }

  before do
    receipt.puts expected_output
    allow(ReceiptFactory).to receive(:new).and_return(receipt_factory)
    allow(receipt_factory).to receive(:print_receipt).and_return(receipt)
    allow(CalculatorService).to receive(:new).and_return(calculator_service)
    allow(calculator_service).to receive(:calculate).and_return([combination])
  end

  describe 'process_order' do
    let(:subject) { described_class.new(products).process_order(input) }

    it 'calls the calculator service' do
      subject
      expect(calculator_service).to have_received(:calculate)
    end

    it 'calls the receipt_factory' do
      subject
      expect(calculator_service).to have_received(:calculate)
    end

    it 'returns a receipt' do
      expect(subject).to eq expected_output
    end

    context 'order size too great' do
      let(:quantity) { 10_000 }
      it 'returns the expected_output' do
        expect(subject).to eq 'We cannot process an order that large'
      end

      it 'does not call the calculator service' do
        expect(CalculatorService).to_not receive(:new)

      end

      it 'does not call the receipt factory' do
        expect(ReceiptFactory).to_not receive(:new)
      end
    end

    context 'items cannot be packed' do
      before { allow(calculator_service).to receive(:calculate).and_return([]) }

      it 'returns the expected_output' do
        expect(subject).to eq 'Cannot process all items'
      end

      it 'does not call the receipt factory' do
        expect(ReceiptFactory).to_not receive(:new)
      end
    end
  end
end
