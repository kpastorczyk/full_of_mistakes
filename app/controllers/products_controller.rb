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
    @product = Product.new(product_params)

    if @product.save
      render json: @product
    else
      render json: @product.errors
    end
  end

  def uniq_categories
    render json: Product.uniq_categories
  end

  def expensive_categories
    render json: Product.get_categories_at_least_2_products_above(1000.00)
  end

  private

  def product_params
    params.require(:product).permit(:name, :price)
  end
end
