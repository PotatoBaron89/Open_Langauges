class StaticPagesController < ApplicationController
  def home
    @pagy, @sample_courses = pagy(Course.all.includes(:cover_image_attachment))
  end

  def privacy_policy

  end
end
