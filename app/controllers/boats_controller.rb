class BoatsController < ApplicationController
  def index
    @boats = policy_scope(Boat)
  end

  def new
    @boat = Boat.new
    authorize @boat
  end

  def create
    # @boat = Boat.new(boat_params)
    # @boat.user = current_user
    @boat = current_user.boats.build(boat_params)
    authorize @boat
    if @boat.save
      redirect_to root_path
    else
      render :show
    end
  end

  def show
    @boat = Boat.find(params[:id])
    authorize @boat
  end

  def edit
    @boat = Boat.find(params[:id])
    authorize @boat
  end

  def update
    @boat = Boat.find(params[:id])
    authorize @boat
    @boat.update(boat_params)
    redirect_to boat_path(@boat)
  end

  def destroy
    @boat = Boat.find(params[:id])
    @boat.destroy
    redirect_to root_path
  end

  private
  def boat_params
    params.require(:boat).permit(:user_id, :name, :boat_type, :city, :price, :size)
  end
end
