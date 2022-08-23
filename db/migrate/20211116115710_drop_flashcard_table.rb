class DropFlashcardTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :flashcard_courses
  end
end
