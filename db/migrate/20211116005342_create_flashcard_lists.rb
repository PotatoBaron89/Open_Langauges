class CreateFlashcardLists < ActiveRecord::Migration[6.1]
  def change
    create_table :flashcard_lists do |t|
      t.references :flashcard
      t.references :lesson, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
