class AvailibilitiesController < ApplicationController

  def index
    @availibilities = Availibility.all
  end

  def new
    @boat = current_user
    @availibility = Availibility.new
  end

  def create
    @boat = current_user
    @availibility = Availibility.new(availibility_params)
    @availibility.boat = @availibility
    if @availibility.save
      redirect_to user_boat_path(@boat)
    else
      render :new
    end
  end
  def show
    @boat = boat.find(params[:boat_id])
    @availibility = Availibility.find(availibility_params)
  end

  def edit
    @boat = boat.find(params[:boat_id])
    @availibility = Availibility.find(availibility_params)
  end

  def update
    if @availibility.update(availibility_params)
      redirect_to @availibility, notice: 'availibility was successfully updated.'
    else
      render :edit
    end
  end

    def destroy
    @availibility.destroy
    redirect_to availibilitys_url, notice: 'availibility was successfully destroyed.'
  end

  private
  def availibility_params
    params.require(:availibility).permit(:available_from, :available_to, :boat_id)
  end
end
