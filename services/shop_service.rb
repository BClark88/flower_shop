require 'stringio'
require_relative '../factories/receipt_factory'
require_relative '../models/product'
require_relative '../models/bundle'
require_relative './calculator_service'

class ShopService
  def initialize(products)
    @products = products
  end

  def process_order(input)
    codes = input.map { |index| index[:code] }
    return 'Product code does not exist' unless codes.all? { |code| product_exists?(code) }

    receipt = StringIO.new
    input.each do |item|
      return 'We cannot process an order that large' if item[:quantity] >= 10_000

      result = order(item[:code], item[:quantity])
      return 'Cannot process all items' if result.nil?

      receipt.puts result.string
    end
    receipt.string.strip
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

