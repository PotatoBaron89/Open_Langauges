class LessonResultsController < ApplicationController
  before_action :set_lesson_result, only: %i[ show edit update destroy ]

  #### IN DEVELOPMENT FEATURE, STILL IN EARLY STAGES OF DEVELOPMENT

  # GET /lesson_results or /lesson_results.json
  def index
    @lesson_results = LessonResult.all
  end

  # GET /lesson_results/1 or /lesson_results/1.json
  def show
  end

  # GET /lesson_results/new
  def new
    @lesson_result = LessonResult.new
  end

  # GET /lesson_results/1/edit
  def edit
  end

  # POST /lesson_results or /lesson_results.json
  def create
    @lesson_result = LessonResult.new(lesson_result_params)

    respond_to do |format|
      if @lesson_result.save
        format.html { redirect_to @lesson_result, notice: "Lesson result was successfully created." }
        format.json { render :show, status: :created, location: @lesson_result }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lesson_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lesson_results/1 or /lesson_results/1.json
  def update
    respond_to do |format|
      if @lesson_result.update(lesson_result_params)
        format.html { redirect_to @lesson_result, notice: "Lesson result was successfully updated." }
        format.json { render :show, status: :ok, location: @lesson_result }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesson_results/1 or /lesson_results/1.json
  def destroy
    @lesson_result.destroy
    respond_to do |format|
      format.html { redirect_to lesson_results_url, notice: "Lesson result was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson_result
      @lesson_result = LessonResult.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lesson_result_params
      params.require(:lesson_result).permit(:lesson_id)
    end
end
