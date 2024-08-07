class ReviewsController < ApplicationController
    
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to @product
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    redirect_to @product
    @review.destroy
  end

  private 

  def review_params
    params.require(:review).permit(:rating, :description)
  end
end
