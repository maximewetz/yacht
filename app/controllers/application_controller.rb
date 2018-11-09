class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_profile

  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def set_profile
    if current_user && current_user.profile
      @profile = current_user.profile
    end
  end
end
