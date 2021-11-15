class AdminController < ApplicationController
  def dashboard

  end

  def roles
    @pagy, @roles = pagy(Role.all)
  end
end
