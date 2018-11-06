class ProfilesController < ApplicationController

  def index
    @profiles = Profile.all
  end
  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @profile = Profile.new

  end

  def create
    @user = User.find[:user_id]
    @profile = Profile.new(profile_params)
    @profile.user = @user
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
    @user = @profile.user
    @profile.destroy

    # no need for app/views/cocktails/destroy.html.erb
    redirect_to boats_path
  end


  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :phone_number)
  end
end
