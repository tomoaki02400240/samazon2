class ProductsController < ApplicationController
  PER = 15
  def index
    @products = Product.page(params[:page]).per(PER)
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews.order(created_at: "DESC")
  end

  def edit
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    # debugger
    @product = Product.new(product_params.merge(category_id: params[:product][:category_id]))
    # @product.category_id = 1
    @product.save
    redirect_to product_path(@product)
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to products_url(@product)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  def favorite
    @product = Product.find(params[:id])
    current_user.toggle_like!(@product)
    redirect_to product_path(@product)
  end
  private

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
