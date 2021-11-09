class CreateFlashcardCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :flashcard_courses do |t|
      t.references :course, null: false, foreign_key: true
      t.references :flashcard, null: true, foreign_key: true

      t.timestamps
    end

    add_index :flashcard_courses, [:course_id, :flashcard_id], unique: true
  end
end
