class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.string :answer
      t.string :question
      t.references :user, null: false, foreign_key: true
      t.references :quiz, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
