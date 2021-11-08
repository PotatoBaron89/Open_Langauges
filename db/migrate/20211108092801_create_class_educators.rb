class CreateClassEducators < ActiveRecord::Migration[6.1]
  def change
    create_table :class_educators do |t|
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
