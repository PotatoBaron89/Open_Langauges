class CreateLessonVocabs < ActiveRecord::Migration[6.1]
  def change
    create_table :lesson_vocabs do |t|
      t.references :lesson, null: false, foreign_key: true
      t.references :word, null: false, foreign_key: true
      t.string :title
      t.integer :language

      t.timestamps
    end
  end
end
