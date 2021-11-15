class UsersController < ApplicationController
  # before_action :set_user, only: %i[ show edit update destroy ]
  before_action :check_auth, only: %i[ edit update destroy ]



  # GET /users or /users.json
  def index
    @pagy, @users = pagy(User.all
                 .includes(image_attachment: :blob))
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  def account
    @user = User.find(current_user[:id])
    @timezones = ActiveSupport::TimeZone.all
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @timezones = ActiveSupport::TimeZone.all
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :dob, :display_name, :about, :image, :timezone, :image)
    end

  def check_auth
    return true if user_signed_in?
    flash[:notice] = "Insufficient privileges"
    redirect_to root_path
  end


end
