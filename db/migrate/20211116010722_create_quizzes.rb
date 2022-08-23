class CreateQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :quizzes do |t|
      t.belongs_to :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
