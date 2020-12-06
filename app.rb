require_relative './models/shop'

class Application
  def initialize(products)
    @shop = Shop.new(products)
  end

  def run
    loop do
      puts 'Welcome to Best Buds Flower Shop'

      receive_orders

      puts 'Do you want to process another order? Y/N'
      answer = gets.chomp
      until VALID_ANSWERS.include? answer.upcase
        puts 'Please enter either Y or N'
        puts 'Do you want to order again? Y/N'
        answer = gets.chomp
      end
      if answer == 'N'
        exit
      else
        next
      end
    end
  end

  private

  VALID_ANSWERS = %w[Y N].freeze

  def add_to_order
    puts 'Please enter an amount and product code separated by a space e.g. 10 R12. Max order size is 9,999'
    input = gets.chomp
    quantity, product_code = input.scan(/\w+/)
    until product_code.instance_of?(String) && quantity.match?(/\A\d+\z/)
      puts 'Please enter a valid quantity and code'
      input = gets.chomp
      quantity, product_code = input.scan(/\w+/)
    end
    { code: product_code, quantity: quantity.to_i }
  end

  def process_order(order_list)
    @shop.process_order(order_list)
  end

  def receive_orders
    order_list = []
    order_item = add_to_order
    order_list.push(order_item)
    loop do
      puts 'Order added. Do you want to order something else? Y/N'
      answer = gets.chomp
      until VALID_ANSWERS.include? answer.upcase
        puts 'Please enter either Y or N'
        puts 'Do you want to order again? Y/N'
        answer = gets.chomp
      end
      if answer == 'N'
        puts process_order(order_list)
        break
      else
        order_item = add_to_order
        order_list.push(order_item)
      end
    end
  end
end

r_12_bundles = [Bundle.new(10, 1299), Bundle.new(5, 699)]
l_09_bundles = [Bundle.new(9, 2495), Bundle.new(6, 1695), Bundle.new(3, 995)]
t_58_bundles = [Bundle.new(9, 1699), Bundle.new(5, 995), Bundle.new(3, 595)]
r_12_product = Product.new('Roses', 'R12', r_12_bundles)
l_09_product = Product.new('Lilies', 'L09', l_09_bundles)
t_58_product = Product.new('Tulips', 'T58', t_58_bundles)
products = [r_12_product, l_09_product, t_58_product]

app = Application.new(products)
app.run
