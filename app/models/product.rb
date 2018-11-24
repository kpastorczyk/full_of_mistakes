class Product < ApplicationRecord
  validates :name, presence: true
  validates_numericality_of :price, :greater_than => 0

  def self.uniq_categories
    pluck(:category).uniq.compact
  end

  def self.get_categories_at_least_2_products_above(price)
    where('price > ?', price).group('category').having('count(category) > 1').pluck("category")
  end
end
