class WordsController < ApplicationController
  before_action :set_word, only: %i[ show edit update destroy ]

  # GET /words or /words.json
  def index
    # Retreive all words and paginate them to increase performance
    @pagy, @words = pagy(Word.all)

  end

  # GET /words/1 or /words/1.json
  def show
    # Retreive definitions of the selected word. If there is more than 20 (default) definitions, paginate them to increase performance.
    @pagy, @definitions = pagy(Definition.where(word_id: @word.id))
  end

  # GET /words/new
  def new
    #Create a new instance of the word model, pass it to our form
    @word = Word.new
              .page(params[:page])
  end

  # GET /words/1/edit
  def edit
  end

  # POST /words or /words.json
  def create
    #Assign the params passed back to @word through words_param, attempt to save.
    @word = Word.new(word_params)

    respond_to do |format|
      if @word.save
        format.html { redirect_to @word, notice: "Word was successfully created." }
        format.json { render :show, status: :created, location: @word }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /words/1 or /words/1.json
  def update
    respond_to do |format|
      if @word.update(word_params)
        format.html { redirect_to @word, notice: "Word was successfully updated." }
        format.json { render :show, status: :ok, location: @word }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1 or /words/1.json
  def destroy
    @word.destroy
    respond_to do |format|
      format.html { redirect_to words_url, notice: "Word was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def word_params
      params.require(:word).permit(:word, :class)
    end
end
