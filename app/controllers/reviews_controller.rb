class ReviewsController < ApplicationController
  def create
    product = Product.find(params[:id])
    review = product.reviews.new(review_params)
   
    # review.content = review_params[:content] 
    # review.user_id = current_user.id
    # debugger
    review.save
    redirect_to product_path(product)
   # debugger
  end

  private 

  def review_params
    params.permit(:content, :score).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
