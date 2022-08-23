class LessonVocabsController < ApplicationController
  before_action :set_lesson_vocab, only: %i[ show edit update destroy ]

  # GET /lesson_vocabs or /lesson_vocabs.json
  def index
    @lesson_vocabs = LessonVocab.all
  end

  # GET /lesson_vocabs/1 or /lesson_vocabs/1.json
  def show
  end

  # GET /lesson_vocabs/new
  def new
    @lesson_vocab = LessonVocab.new
  end

  # GET /lesson_vocabs/1/edit
  def edit
  end

  # POST /lesson_vocabs or /lesson_vocabs.json
  def create
    @lesson_vocab = LessonVocab.new(lesson_vocab_params)

    respond_to do |format|
      if @lesson_vocab.save
        format.html { redirect_to @lesson_vocab, notice: "Lesson vocab was successfully created." }
        format.json { render :show, status: :created, location: @lesson_vocab }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lesson_vocab.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lesson_vocabs/1 or /lesson_vocabs/1.json
  def update
    respond_to do |format|
      if @lesson_vocab.update(lesson_vocab_params)
        format.html { redirect_to @lesson_vocab, notice: "Lesson vocab was successfully updated." }
        format.json { render :show, status: :ok, location: @lesson_vocab }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson_vocab.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesson_vocabs/1 or /lesson_vocabs/1.json
  def destroy
    @lesson_vocab.destroy
    respond_to do |format|
      format.html { redirect_to lesson_vocabs_url, notice: "Lesson vocab was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson_vocab
      @lesson_vocab = LessonVocab.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lesson_vocab_params
      params.require(:lesson_vocab).permit(:lesson_id, :word_id, :title, :language)
    end
end
