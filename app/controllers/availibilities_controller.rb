class AvailibilitiesController < ApplicationController

  def index
    @availibilities = Availibility.all
  end

  def show
    @availibility = Availibility.find(params[:id])
  end

  def new
    @availibility = Availibility.new
  end

  def edit
    @availibility = Availibility.find(params[:id])
  end

  def create
    @availibility = Availibility.new(availibility_params)

    if @availibility.save
      redirect_to @availibility, notice: 'availibility was successfully created.'
    else
      render :new
    end
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
      params.require(:availibility).permit(:booked_from, :booked_to)
    end
# end
end

end
