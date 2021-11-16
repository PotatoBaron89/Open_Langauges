class CreateGrades < ActiveRecord::Migration[6.1]
  def change
    create_table :grades do |t|
      t.string :score
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
