class ApplicationController < ActionController::Base
  include Pagy::Backend
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

end
