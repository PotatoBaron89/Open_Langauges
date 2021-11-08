class StaticPagesController < ApplicationController
  def home
    @course = Course.all
  end

  def privacy_policy

  end
end
