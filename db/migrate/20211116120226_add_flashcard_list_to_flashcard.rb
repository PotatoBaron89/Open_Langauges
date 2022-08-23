class AddFlashcardListToFlashcard < ActiveRecord::Migration[6.1]
  def change
    add_reference :flashcards, :flashcard_list, null: false, foreign_key: true
  end
end
