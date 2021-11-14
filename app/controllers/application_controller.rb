class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :set_timezone


  protected

  def set_timezone
    if current_user && !current_user[:timezone]
      current_user[:timezone] = User.find(current_user[:id]).timezone
    end
  end

end
