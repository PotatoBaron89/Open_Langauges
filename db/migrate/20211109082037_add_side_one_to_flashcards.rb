class AddSideOneToFlashcards < ActiveRecord::Migration[6.1]
  def change
    add_column :flashcards, :side_one, :string
    add_column :flashcards, :side_two, :string
  end
end
