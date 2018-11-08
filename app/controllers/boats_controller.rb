class BoatsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index

    @boats = Boat.all

    if params[:city].present?
      @boats = @boats.where(city: params[:city])
    end

    if params[:boat_type].present?
      @boats = @boats.where(boat_type: params[:boat_type])
    end

    if params[:price]
      @boats = @boats.where(price: params[:price])
    end

    if params[:size].present?
      @boats = @boats.where(size: params[:size])
    end

    policy_scope(@boats)

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
      redirect_to boat_path(@boat)
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
    authorize @boat
    @boat.destroy
    redirect_to user_profile(current_user)
  end

  private
  def boat_params
    params.require(:boat).permit(:user_id, :name, :boat_type, :city, :price, :size)
  end
end
