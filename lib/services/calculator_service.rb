module FlowerShop
  class CalculatorService
    def calculate(quantity, bundles)
      find_optimal_combination(quantity, bundles)
    end

    private

    def find_optimal_combination(quantity, bundles) # rubocop:disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
      bundles_sorted_by_max = bundles.sort_by(&:quantity)
      possible_combinations = Hash.new do |hash, key|
        hash[key] =
          if key < bundles_sorted_by_max.first.quantity
            []
          elsif bundles_sorted_by_max.any? { |bundle| bundle.quantity == key }
            suitable_bundle = bundles.find { |bundle| bundle.quantity == key }
            [suitable_bundle]
          else
            potential_packages = bundles_sorted_by_max.select { |bundle| bundle.quantity < key }
            usable_combinations = potential_packages.inject([]) do |memo, bundle|
              memo.any? { |old_bundle| (old_bundle.quantity % bundle.quantity).zero? } ? memo : memo + [bundle]
            end
            possible_combinations = usable_combinations.map do |bundle|
              [bundle] + hash[key - bundle.quantity]
            end
            possible_combinations.select { |combination| combination.sum(&:quantity) == key }.min_by(&:size) || []
          end
      end
      possible_combinations[quantity]
    end
  end
end
