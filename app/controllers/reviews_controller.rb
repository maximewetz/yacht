class ReviewsController < ApplicationController
def index
  @reviews = policy_scope(Review)
end

def show
  authorize @review
end

def new
  @user = current_user
  @boat = Boat.find(params[:boat_id])
  @review = Review.new
  authorize @review
end

def create
  @user = current_user
  @boat = Boat.find(params[:boat_id])
  @review = Review.new(reviews_params)
  authorize @review
  if @review.save
      redirect_to root_path
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
