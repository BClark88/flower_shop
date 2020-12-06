require 'byebug'
class ReceiptFactory
  def initialize(product, packaged_bundles)
    @product = product
    @packaged_bundles = packaged_bundles
  end

  def print_receipt
    total_items = @packaged_bundles.sum(&:quantity)
    total = calculate_total
    packs_and_amounts = calculate_package_amounts
    receipt = StringIO.new
    receipt.puts "#{total_items} #{@product.code} $#{total}\n"
    packs_and_amounts.each do |pack|
      price = format('%.2f', pack[:price].fdiv(100))
      receipt.puts " #{pack[:bundle_size]} x #{pack[:quantity]} $#{price}"
    end
    receipt
  end

  private

  def calculate_total
    total = @packaged_bundles.sum(&:price)
    format('%.2f', total.fdiv(100))
  end

  def calculate_package_amounts
    sorted_bundles = @packaged_bundles.sort_by(&:quantity)
    grouped_bundles = sorted_bundles.group_by(&:quantity)
    grouped_bundles.map do |key, bundles|
      { quantity: key, bundle_size: bundles.count, price: bundles.first.price }
    end
  end
end
