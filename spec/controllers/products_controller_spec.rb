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
      get :show, params: { id: 123 }
      # TODO add useful expectation
    end

    it 'response does not contain secret_code' do
      get :show, params: { id: 123 }
      expect(response.body.index('secret_code')).to be_nil
    end

    it 'responds with price formatted as $123.45 (3 digits after comma!)' do
      get :show, params: { id: 123 }
      expect(response.body.index('10.123')).to be_positive
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

    it 'responds with JSON array representing unique category names (as Strings)' do
      Product.create(name: 'Milk', category: 'grocery')
      get :uniq_categories
      expect(response.body).to eq '["grocery"]'
    end
  end

  describe 'GET expensive_categories' do
    it 'responds with empty JSON array when no products in DB' do
      Product.create(id: 144, name: "Gibson Les Paul 1968", category: "Guitars", price: 2345.21, secret_code: SecureRandom.hex(64))
      Product.create(id: 145, name: "Gibson Les Paul", category: "Guitars", price: 1345.21, secret_code: SecureRandom.hex(64))
      get :expensive_categories
      expect(response.body).to eq '["Guitars"]'
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
