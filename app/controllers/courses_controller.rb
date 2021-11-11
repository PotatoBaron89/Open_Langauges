class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy ]
  before_action :check_auth

  # GET /courses or /courses.json
  def index
    @courses = Course.all
                 .order(created_at: :desc).page(params[3])
  end

  # GET /courses/1 or /courses/1.json
  def show
    @user = [current_user]
    @like = current_user.likes.find_by(course: @course)
    @subscribe = current_user.subscribes.find_by(course: @course)
    @wish = current_user.wishes.find_by(course: @course)
    @lessons = Lesson.where(course_id: params[:id])

    ### There must be a cleaner way
    # Find All Students
    list = Course.find(params[:id]).class_list
    student_list = []
    list.each do |user|
      student_list << user.user_id
    end
    @students = User.find(student_list)

    # Find All Educators
    list = Course.find(params[:id]).class_educator
    educator_list = []
    list.each do |user|
      educator_list << user.user_id
    end
    @educators = User.find(educator_list)
  end

  # GET /courses/new
  def new
    @course = Course.new

    # May want to add options later to pass in more options. Don't want to pass in entire list of users, however.
    # For now just provide current user.
    @user = [current_user]
    # @user = User.all
  end

  def courselist
    @courses = Course.all
  end

  # GET /courses/1/edit
  def edit
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
end
