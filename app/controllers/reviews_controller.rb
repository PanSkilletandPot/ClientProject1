class ReviewsController < ApplicationController
  include UserHelper
  def post
    require_user
    @review = Review.new(review_params)
  end
end
