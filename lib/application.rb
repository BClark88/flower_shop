require_relative './flower_shop'

class Application
  def initialize(products)
    @shop = FlowerShop::ShopService.new(products)
    @valid_codes = products.map(&:code)
  end

  def run
    loop do
      puts 'Welcome to Best Buds Flower Shop'

      receive_orders

      puts 'Do you want to process another order? Y/N'
      answer = gets.chomp.upcase
      until VALID_ANSWERS.include? answer
        puts 'Please enter either Y or N'
        puts 'Do you want to order again? Y/N'
        answer = gets.chomp
      end
      if answer == 'N'
        break
      else
        next
      end
    end
  end

  private

  VALID_ANSWERS = %w[Y N].freeze

  def process_order(order_list)
    @shop.process_order(order_list)
  end

  def receive_orders
    order_list = []
    order_item = add_to_order
    order_list.push(order_item)
    loop do
      puts 'Order added. Do you want to order something else? Y/N'
      answer = gets.chomp.upcase
      until VALID_ANSWERS.include? answer
        puts 'Please enter either Y or N'
        puts 'Do you want to order again? Y/N'
        answer = gets.chomp.upcase
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

  def add_to_order
    puts 'Please enter an amount and product code separated by a space e.g. 10 R12. Max order size is 9,999'
    input = gets.chomp.upcase
    quantity, product_code = input.scan(/\w+/)
    until @valid_codes.include?(product_code) && quantity.match?(/\A\d+\z/)
      puts 'Please enter a valid quantity and code'
      input = gets.chomp.upcase
      quantity, product_code = input.scan(/\w+/)
    end
    { code: product_code, quantity: quantity.to_i }
  end
end
