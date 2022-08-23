class AddQuizIdToLessonResult < ActiveRecord::Migration[6.1]
  def change
    add_reference :lesson_results, :quiz, null: false, foreign_key: true
    add_reference :lesson_results, :user, null: false, foreign_key: true
  end
end
