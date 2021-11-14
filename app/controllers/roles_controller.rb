class RolesController < ApplicationController
  def index
    redirect_to admin_roles_path
  end

  def show

  end

  def create
    @role = Role.new(role_params)
    if !@role.save
      flash[:notice] = @role.errors.full_messages.to_sentence
    else
      flash[:notice] = "New role created"

    redirect_to admin_roles_path
    end
  end

  def destroy
    Role.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to admin_roles_path, notice: "Role was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def role_params
    params.require(:role).permit(:name)
  end

end