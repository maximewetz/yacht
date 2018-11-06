class ReviewsController < ApplicationController
def index
  @reviews = Review.all
end

def show
end

def new
  @review = Review.new
end

def create
  @review = Review.new(review_params)
  # if @review.save
  #     redirect_to new_review_dose_path(@review)
  # else
  #     render :new
  # end
end

def destroy
  @review.destroy
end


private

  def cocktail_params
    params.require(:review).permit(:rating, :comment)
  end

end
