class ProfilesController < ApplicationController

  def index
    @profiles = Profile.all
  end

  def show
    @user = current_user
    @profile = current_user.profile
    authorize @profile
  end

  def new
    @profile = Profile.new
    authorize @profile
  end

  def create
    @profile = Profile.new(profile_params)
    authorize @profile
    @profile.user = current_user
    if @profile.save
      redirect_to user_profile_path(current_user)
    else
      render :new
    end
  end

  def edit
    @profile = current_user.profile
    authorize @profile
  end

  def update
      @profile = current_user.profile
      authorize @profile
    if @profile.save!
      redirect_to(:action => "show", :profile => @profile.id)
    else
      render :edit
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    authorize @profile
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
