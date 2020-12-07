require_relative './lib/application'
r_12_bundles = [FlowerShop::Bundle.new(10, 1299), FlowerShop::Bundle.new(5, 699)]
l_09_bundles = [FlowerShop::Bundle.new(9, 2495), FlowerShop::Bundle.new(6, 1695), FlowerShop::Bundle.new(3, 995)]
t_58_bundles = [FlowerShop::Bundle.new(9, 1699), FlowerShop::Bundle.new(5, 995), FlowerShop::Bundle.new(3, 595)]
r_12_product = FlowerShop::Product.new('Roses', 'R12', r_12_bundles)
l_09_product = FlowerShop::Product.new('Lilies', 'L09', l_09_bundles)
t_58_product = FlowerShop::Product.new('Tulips', 'T58', t_58_bundles)
products = [r_12_product, l_09_product, t_58_product]

app = Application.new(products)
app.run
