require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  before(:each) do
    Product.create(id: 123, name: 'Milk', secret_code: SecureRandom.hex(64), price: 10.1234)
    Product.create(id: 124, name: 'Water', secret_code: SecureRandom.hex(64), price: 10.1234)
  end

  describe 'GET index' do
    it 'should return json list of products' do
      get :index, format: :json

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json')
      expect(JSON(response.body).count).to eq 2
    end

    it 'should return html list of products' do
      get :index

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('text/html')
    end
  end

  describe 'GET show' do
    it 'TODO some meaningfull description for the endpoint' do
      # Product.create(id: 123, name: 'Milk', secret_code: 'secret code 123', price: 10.1234)
      get :show, params: { id: 123 }
      # TODO add useful expectation
    end

    it 'response does not contain secret_code' do
      pending('I\'ll do it tomorrow')
      # Product.create(id: 123, name: 'Milk', secret_code: 'secret code 123', price: 10.1234)
      get :show, params: { id: 123 }
      expect(response.body.index('secret code 123')).to be_nil
    end

    it 'responds with price formatted as $123.45 (3 digits after comma!)' do
      # Product.create(id: 123, name: 'Milk', secret_code: 'secret code 123', price: "10.12345")
      get :show, params: { id: 123 }
      expect(response.body.index('10.123,')).to be_positive
    end

    it 'responds with ' do
      # Product.create(id: 123, name: 'Milk', secret_code: 'secret code 123', price: "10.12345")
      get :show, params: { id: 123 }
      expect(response.body.index('10.123,')).to be_positive
    end
  end

  xdescribe 'GET seed' do
    it 'responds with .....' do
      assert false, 'some bad developer haven\'t even added test for it'
    end
  end

  describe 'GET uniq_categories' do
    it 'responds with empty JSON array when no products in DB' do
      get :uniq_categories
      expect(response.body).to eq '[]'
    end

    xit 'responds with JSON array representing unique category names (as Strings)' do
      Product.create(name: 'Milk', category: 'grocery')
      get :uniq_categories
      expect(response.body).to eq '["grocery"]'
    end
  end

  describe 'GET expensive_categories' do
    # TODO return JSON with category names, but only those containing at least 2 products with price above 1000.00.
    # i.e. ['cars']. But no 'grocery' nor Guitars (there is only 1 guitar with price above 1000)
    # Product name, Price, Category
    # Milk, 0.81 USD, grocery
    # Butter, 1.51 USD, grocery
    # Ford Focus, 20000 USD, cars
    # BMW X7, 95.000 USD, cars
    # Fender Stratocaster custom, 1200 USD, guitars
    # Fender Squier, 300 USD, guitars
    it 'responds with empty JSON array when no products in DB' do
      get :expensive_categories
      expect(response.body).to eq '["cars"]'
    end
  end
  describe 'POST create' do
    it 'adds product' do
      post :show, product: { name: 'iWatch', price: 123 }
      # expect...
    end

    it '... empty name...' do
      pending 'does not save product without a name'
    end

    it 'adds product' do
      pending 'does not save product with negative price'
    end
  end

  xdescribe 'DELETE destroy' do
    it 'removes all products from database' do
      assert false, 'some bad developer haven\'t even added test for it'
    end

    context 'when category in URL is provided' do
      it 'removes only the products from given category' do
        assert false, 'some bad developer haven\'t even added test for it'
      end
    end
  end
end
