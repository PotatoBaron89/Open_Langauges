class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy ]
  before_action :check_auth
  before_action :set_user, only: [:show]

  # GET /courses or /courses.json
  def index
    @courses = Course.all
                 .order(created_at: :desc).page(params[3])
  end

  # GET /courses/1 or /courses/1.json
  def show
    @like = current_user.likes.find_by(course: @course)
    @subscribe = current_user.subscribes.find_by(course: @course)
    @wish = current_user.wishes.find_by(course: @course)
    @course = Course.includes(:user, lessons: [user: [image_attachment: :blob]]).find(params[:id])
  end

  # GET /courses/new
  def new
    @course = Course.new
    authorize @course

    # May want to add options later to pass in more options. Don't want to pass in entire list of users, however.
    # For now just provide current user.
    @user = [current_user]
  end

  def courselist
    @options = ["title" , "contents"]
    if params[:search]
      @pagy, @courses = pagy(Course.where("#{params[:options]} LIKE ?", "%#{params[:search]}%")
                   .includes(:rich_text_contents, cover_image_attachment: :blob, user: [:image_attachment] ))
    else
      @pagy, @courses = pagy(Course.all.order(created_at: :desc)
                   .includes(:rich_text_contents, cover_image_attachment: :blob, user: [image_attachment: :blob] ))
    end
  end

  # GET /courses/1/edit
  def edit
    authorize @course
    @user = [current_user]
  end

  # POST /courses or /courses.json
  def create
    @user = [current_user]
    @course = Course.new(course_params)


    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: "Course was successfully created." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    authorize @course
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to course_list_path, notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    authorize @course
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: "Course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:title, :contents, :user_id, :cover_image, :price, :Ispremium, :isarchived)
    end

  private

  def check_auth
    return true if user_signed_in?
    flash[:notice] = "Insufficient privileges"
    redirect_to root_path
  end

  def set_user
    @current_user ||= User.includes(image_attachment: :blob).find(current_user.id)
  end

end
