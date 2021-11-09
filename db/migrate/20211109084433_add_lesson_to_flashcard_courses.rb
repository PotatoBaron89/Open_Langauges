class AddLessonToFlashcardCourses < ActiveRecord::Migration[6.1]
  def change
    add_reference :flashcard_courses, :lesson, null: true, foreign_key: true
  end
end
