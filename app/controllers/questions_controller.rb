class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]

  # GET /questions or /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1 or /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
    @quiz = Quiz.find(@question.quiz.id)

  end

  # POST /questions or /questions.json
  def create
    @question = Question.new(question_params)
    # Check Response type, this method faciliates Turbo, allowing better performance via reduced need for page refreshes.

    respond_to do |format|
      if @question.save!
        format.turbo_stream do
          @quiz = Quiz.find(@question.quiz.id)

          render turbo_stream: [
            turbo_stream.update('question_form',
                                partial: '/questions/form',
                                quiz: @quiz,
                                question: Question.new ),
            turbo_stream.prepend('question_list', edit: true,
                                 partial: 'shared/Components/list_item_turbo',
                                 path: question_path(@question.id),
                                 locals: { body: @question, edit_path: edit_question_path(@question.id),
                                           path: flashcard_list_path(@question.id),
                                           content:
                                             [@question.question, @question.answer] })
          ]
        end
        format.html { redirect_to @question, notice: "Question was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: "Question was successfully updated." }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    path_back = @question
    @question.destroy
    respond_to do |format|
      format.html { redirect_to quiz_path(path_back.quiz.id), notice: "Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:question, :answer, :quiz_id, :working_out_example, :hint)
    end
end
