class FlashcardListController < ApplicationController
  def index

  end

  def destroy
    FlashcardList.delete(params[:id])

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.remove(@message)

      end
      # format.html { redirect_to admin_roles_path, notice: "Role was successfully destroyed." }
      # format.json { head :no_content }
    end

  end

  def edit
  end

  def new

  end

  def create
    @flashcardlist = FlashcardList.new(flash_params)

    respond_to do |format|
      if @flashcardlist.save!
        format.turbo_stream do
          @lesson = Lesson.find(params[:flashcard_list][:lesson_id])
          render turbo_stream: [
            turbo_stream.update('flash_list_form',
                                partial: '/flashcard_list/form',
                                flashcard_list: FlashcardList.new,
                                lesson: @lesson),
            turbo_stream.prepend('flashcard-list',
                                 partial: "shared/Components/list_item_turbo",
                                 locals: { body: @flashcardlist,
                                           path: flashcard_list_path(@flashcardlist.id),
                                           content:
                                             [@flashcardlist.title] })
            ]
        end
        format.html { redirect_to @flashcardlist.lesson, notice: "Flashcard was successfully created." }
        format.json { render :show, status: :created, location: @flashcard }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flashcard.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @pagy, @flashcards = pagy(Flashcard.where(flashcard_list: params[:id]).includes(:rich_text_side_one, :rich_text_side_two), items: 24)
    @flashcard_list = FlashcardList.find(params[:id])
  end

  def shuffle
    # raise StandardError.new params
    # @flashcard_list = FlashcardList.find(params[:flashcard_list_id])
    # raise StandardError.new @flashcard_list.id
    @pagy, @flashcards = pagy(Flashcard.where(flashcard_list: params[:flashcard_list_id]).includes(:rich_text_side_one, :rich_text_side_two), items: 24)


    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.update('flashcard_panel',
                               partial: "shared/Components/flashcard_panel",
                               locals: {body: @flashcards} )]
        end
      end
    end

  private

  def flash_params
    params.require(:flashcard_list).permit(:title, :lesson_id)
  end
end
