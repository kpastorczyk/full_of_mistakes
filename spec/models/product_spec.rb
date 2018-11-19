require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'negative price' do
    it 'never saves negative price' do
      @product = Product.new(price: -1)
      @product.save!
      expect(@product.reload.price).to_not be_negative
    end
  end
end
