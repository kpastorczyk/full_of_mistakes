class ProductsController < ApplicationController
  def show
    # reposit... maybe ?
    @product = Product.find(params[:id])
    render json: @product
  end

  def index
    @products = Product.all

    respond_to do |format|
      format.html
      format.json{ render json: @products }
    end
  end

  def seed
    result = @products = ProductSeeder.new(params[:category]).seed
    if result
      render plain: "#{Product.where(category: params[:category]).count}  #{ProductSeeder.category} has just been seeded."
    else
      render plain: 'error', status: 400
    end
  end

  def destroy
    @products = Product.where("category = #{params[:category]}").destroy_all
    head :ok
  end

  def create
    @product = Product.new(params[:product])
    if @product.name.blank?
      raise Exception, 'name can not be empty'
    else
      @product
    end

    head :ok
  end

  def uniq_categories
    # TODO return JSON with an array of all uniq Product.category names in alphabetical order
    # i.e. ['cars', 'grocery', 'guitars']
    render json: ['cars']
  end

  def expensive_categories
    # TODO return JSON with category names, but only those containing to at least 2 products with price above 1000.00.
    # i.e. ['cars']. But no 'grocery' nor Guitars (there is only 1 guitar with price above 1000)
    # Product name, Price, Category
    # Milk, 0.81 USD, grocery
    # Butter, 1.51 USD, grocery
    # Ford Focus, 20000 USD, cars
    # BMW X7, 95.000 USD, cars
    # Fender Stratocaster custom, 1200 USD, guitars
    # Fender Squier, 300 USD, guitars
    @expensive_products = Product.where('1=1').all
    render json: ['cars', 'guitars']
  end
end
