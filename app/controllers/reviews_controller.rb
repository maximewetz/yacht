class ReviewsController < ApplicationController
def index
  @reviews = policy_scope(Review)
  @boat = Boat.find(params[:boat_id])
end

def show
  authorize @review
end

def new
  @boat = Boat.find(params[:boat_id])
  @review = Review.new
  @review.boat = @boat
  authorize @review
end

def create
  @boat = Boat.find(params[:boat_id])
  @review = Review.new(reviews_params)
  @review.boat = @boat
  authorize @review
  if @review.save
      redirect_to boat_path(@boat)
  else
      render :new
  end
end

def destroy
  @review.destroy
  authorize @review
end


private

  def reviews_params
    params.require(:review).permit(:rating, :comment, :boat_id, :user_id)
  end

end
