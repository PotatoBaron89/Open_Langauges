class QuizzesController < ApplicationController
  before_action :set_quiz, only: %i[ show edit update destroy ]
  before_action :signed_in?

  # GET /quizzes or /quizzes.json
  def index
    @quizzes = Quiz.all
  end

  # GET /quizzes/1 or /quizzes/1.json
  def show
    # Return a list of all the questions that belong to that quiz. Paginate the results to increase performance. (to-do: Known bug, currently ignored pagination due to error in Views)
    @pagy, @questions = pagy(Question.where(quiz_id: params[:id]))
  end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
  end

  # GET /quizzes/1/edit
  def edit
    @lesson = Quiz.find(params[:id]).lesson
    @questions = Question.where(quiz_id: params[:id])
  end

  # POST /quizzes or /quizzes.json
  def create
    # Check format, this currently has support for Turbo to increase page performance (less page refrshes required.)

    @quiz = Quiz.new(quiz_params)
    respond_to do |format|
      if @quiz.save
        format.turbo_stream do
          @lesson = Lesson.find(@quiz.lesson_id)

          render turbo_stream: [
            turbo_stream.update('quiz_form',
                                partial: '/quizzes/form',
                                lesson: @lesson,
                                quiz: Quiz.new ),
          turbo_stream.prepend('quiz_list',
                               partial: 'shared/Components/list_item_turbo',
                               path: quiz_path(@quiz.id),
                               locals: { body: @quiz, edit: true,
                                         path: quiz_path(@quiz.id),
                                         content:
                                           [@quiz.title] })
          ]
        end
        format.html { redirect_to @quiz, notice: "Quiz was successfully created." }
        format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzes/1 or /quizzes/1.json
  def update
    respond_to do |format|
      if @quiz.update(quiz_params)

        format.html { redirect_to @quiz, notice: "Quiz was successfully updated." }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1 or /quizzes/1.json
  def destroy
    @quiz.destroy
    respond_to do |format|
      format.html { redirect_to quizzes_url, notice: "Quiz was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quiz_params
      params.require(:quiz).permit(:lesson_id, :title, :multiple_attempts, :hints_enabled, :is_test)
    end

  def signed_in?
    if user_signed_in?
      true
    else
      redirect_to root_path, notice: "Must log in to access this page"
    end
  end
end
