class CreateLessonResults < ActiveRecord::Migration[6.1]
  def change
    create_table :lesson_results do |t|
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
