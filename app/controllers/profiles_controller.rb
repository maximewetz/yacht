class ProfilesController < ApplicationController

  def index
    @profiles = Profile.all
  end
  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to boats_path
    else
      render :new
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
  if @profile.save
    redirect_to(:action => "show", :profile => @profile.id)
  else
    render :edit
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    # no need for app/views/cocktails/destroy.html.erb
    redirect_to boats_path
  end


  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :phone_number)
  end
end
