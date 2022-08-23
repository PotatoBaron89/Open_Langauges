class AdminController < ApplicationController
  def dashboard

  end

  def roles
    # Return a list of all roles and paginate them
    @pagy, @roles = pagy(Role.all)
  end
end
