require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'negative price' do
    it 'never saves negative price' do
      @product = Product.new(price: -1, name: 'Test product')
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:price]).to eq ['must be greater than 0']
    end
  end
end
