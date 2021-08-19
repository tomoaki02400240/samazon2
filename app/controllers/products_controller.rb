class ProductsController < ApplicationController
  PER = 15
  def index
    #@products = Product.page(params[:page]).per(PER)
    #@products = Product.display_list(category_params, params[:page])
    #@category = Category.request_category(category_params)
   if sort_params.present?
      @category = Category.request_category(sort_params[:sort_category])
      @products = Product.sort_product(sort_params, params[:page])
   elsif category_params.present?
      @category = Category.request_category(params[:category])
      @products = Product.category_products(@category, params[:page])
   else
      @products = Product.display_list(params[:page])
   end


    @categories = Category.all
    @major_category_names = Category.pluck(:major_category_name).uniq

    @sort_list = Product.sort_list
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

#  def category_params
 #   params[:category].present? ? params[:category] : "none"
  #end

  def sort_params
    params.permit(:sort, :sort_category)
  end

  def category_params
    params.permit(:category)
  end
end
