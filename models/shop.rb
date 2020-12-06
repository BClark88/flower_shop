require_relative '../factories/receipt_factory'
require_relative '../services/calculator_service'
require_relative './bundle'
require_relative './product'

class Shop
  def initialize(products)
    @products = products
  end

  def process_order(input)
    codes = input.map { |index| index[:code] }
    return 'Product code does not exist' unless codes.all? { |code| product_exists?(code) }

    receipt = ''
    input.each do |item|
      return 'We cannot process an order that large' if item[:quantity] >= 10_000

      result = order(item[:code], item[:quantity])
      return 'Cannot process all items' if result.nil?

      receipt += result.string
    end
    receipt.strip
  end

  private

  def product_exists?(code)
    @products.find { |product| product.code == code }
  end

  def order(code, quantity)
    product = @products.find { |p| p.code == code }
    return if product.bundles.min_by(&:quantity).quantity > quantity

    optimal_combination = CalculatorService.new.calculate(quantity, product.bundles)

    return if optimal_combination.empty?

    ReceiptFactory.new(product, optimal_combination).print_receipt
  end
end

