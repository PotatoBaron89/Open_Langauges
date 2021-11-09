class RemoveCourseFromFlashcardCourses < ActiveRecord::Migration[6.1]
  def change
    remove_column :flashcard_courses, :course_id, :bigint
  end
end
