class ProfilesController < ApplicationController

  def index
    @profiles = Profile.all
  end

  def show
    @profile = current_user.profile
    if @profile.nil?
      redirect_to new_user_profile_path(current_user)
    else
      @profile = current_user.profile
      authorize @profile
    end
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
      redirect_to user_profile_path(current_user), notice: 'User profile was successfully created!'
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
    if @profile.update(profile_params)
      redirect_to user_profile_path(current_user)
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
