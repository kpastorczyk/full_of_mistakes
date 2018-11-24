class Product < ApplicationRecord
  before_validation :ensure_positive_price

  def ensure_positive_price
    self.price = 0 if price.nil? || price < 0
  end

  def self.uniq_categories
    pluck(:category).uniq.compact
  end

  def self.get_categories_at_least_2_products_above(price)
    where('price > ?', price).group('category').having('count(category) > 1').pluck("category")
  end
end
