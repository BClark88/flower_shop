module FlowerShop
  class Bundle
    attr_reader :quantity, :price

    def initialize(quantity, price)
      @quantity = quantity
      @price = price
    end
  end
end
