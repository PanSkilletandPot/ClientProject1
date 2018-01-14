class ReviewsController < ApplicationController
  include ReviewsHelper
  def post
    @review = Review.new(review_params)
  end

   def create
      require_user
	    @review = Review.new(review_params)
	    if @review.save
  	    respond_to do |format|
  	      format.js { render partial: "create_review" }
  	    end
      else
      @errors = @review.errors.full_messages
        respond_to do |format|
          format.js { render partial: "review_create_error", locals:{ errors: @errors} }
        end
      end
    end

    private
     def review_params
      params.require(:review).permit(:rating, :body, :user_id, :recipe_id)
    end
end
