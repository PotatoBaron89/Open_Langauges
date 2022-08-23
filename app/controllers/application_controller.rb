class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit
  protect_from_forgery
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  before_action :set_timezone
  after_action :user_activity


  protected

  def set_timezone
    if current_user && !current_user[:timezone]
      current_user[:timezone] = User.find(current_user[:id]).timezone
    end
  end

  def user_activity
    current_user.try :touch
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
