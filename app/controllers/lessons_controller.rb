class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[ show edit update destroy ]

  # GET /lessons or /lessons.json
  def index
    # Include course[:user], used to check permissions, rich content, used to display text, user:image < user avatars
    @pagy, @lessons = pagy(Lesson.all
                 .includes(:rich_text_content, course: [:user], user: [:image_attachment]))
    @user = current_user
  end

  # GET /lessons/1 or /lessons/1.json
  def show
    # Get list of quizzes and paginate them, default 20 per page.
    @pagy, @quizzes = pagy(Quiz.where(lesson_id: params[:id]).all)
  end

  def register
    ClassList.create!(user_id:@current_user.id, course_id: params[:lesson_id])
    redirect_to course_path(params[:lesson_id]), notice: "Successfully enrolled"
  end

  def paid_register
    redirect_to course_path(params[:lesson_id]), notice: "Featured not implemented yet"
  end

  def cancel
    # Find current registration and delete it
    registration = ClassList.where(user_id:@current_user.id, course_id: params[:lesson_id])
    registration.destroy_all
    redirect_to course_path(params[:lesson_id]), notice: "Successfully Unenrolled"
  end

  # GET /lessons/new
  def new
    authorize @lesson

    if params[:format]
      @lesson = Lesson.new(course_id: params[:format])
      authorize @lesson

      @user = [current_user]
      if params[:format]
        @course = [Course.find(params[:format])]
      else
        redirect_to course_list_path, notice: "Cannot create a Lesson that isn't attached to a course"
      end
    else
      redirect_to course_list_path, notice: "Lessons can only be created from within Course page"
    end

  end



  # GET /lessons/1/edit
  def edit
    authorize @lesson
    @user = [current_user]
    @course = [Course.find(@lesson.course.id)]
  end



  # POST /lessons or /lessons.json
  def create
    @user = [current_user]
    @lesson = Lesson.new(lesson_params)
    authorize @lesson

    respond_to do |format|
      if @lesson.save

        format.html { redirect_to course_path(@lesson.course.id), notice: "Lesson was successfully created." }
        format.json { render :show, status: :created, location: @lesson }
      else

        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /lessons/1 or /lessons/1.json
  def update
    authorize @lesson
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to @lesson, notice: "Lesson was successfully updated." }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /lessons/1 or /lessons/1.json
  def destroy
    authorize @lesson
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to lessons_url, notice: "Lesson was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lesson_params
      params.require(:lesson).permit(:title, :content, :user_id, :course_id)
    end
end
