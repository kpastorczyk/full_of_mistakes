class Product < ApplicationRecord
  before_validation :ensure_positive_price

  def ensure_positive_price
    self.price = 0 if price < 0
  end
end
