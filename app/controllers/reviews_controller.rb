class ReviewsController < ApplicationController
  def create
    product = Product.find(params[:id])
    review = product.reviews.new(review_params)
   
    # review.content = review_params[:content] 
    # review.user_id = current_user.id
    # debugger
    review.save
    redirect_to product_path(product)
    
  end

  private 

  def review_params
    params.permit(:content).merge(user_id: current_user.id)
  end
end
