class Product < ApplicationRecord
  before_validation :ensure_positive_price

  def ensure_positive_price
    self.price = 0 if price.nil? || price < 0
  end

  def self.uniq_categories
    pluck(:category).uniq.compact
  end
end
