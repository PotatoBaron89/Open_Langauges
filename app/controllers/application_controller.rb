class ApplicationController < ActionController::Base
  before_action :set_timezone


  private

  def set_timezone
    current_user[:timezone] = User.find(current_user[:id]).timezone
  end
end
