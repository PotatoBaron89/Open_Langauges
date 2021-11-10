class AdminController < ApplicationController
  def dashboard

  end

  def roles
    @roles = Role.all
  end
end
