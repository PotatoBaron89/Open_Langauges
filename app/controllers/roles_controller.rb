class RolesController < ApplicationController


  def destroy
    Role.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to admin_roles_path, notice: "Role was successfully destroyed." }
      format.json { head :no_content }
    end
  end

end