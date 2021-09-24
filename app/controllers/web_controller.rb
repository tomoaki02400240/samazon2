class WebController < ApplicationController
  def index
    if sort_params.present?
      @category = Category.request_category(sort_params[:sort_category])
      @product = Product.sort_products(sort_params, params[:page])
    elsif params[:category].present?
      @category = Category.request_category(params[:category])
      @products = Product.category_products(@category, params[:page])
    else
      @product = Product.display_list(params[:page])
    end

    @major_category_names = Category.all.pluck(:major_category_name)
    @categories = Category.all
  end

  private

  def sort_params
    params.permit(:sort, :sort_category)
  end
end
