class CreateClassLists < ActiveRecord::Migration[6.1]
  def change
    create_table :class_lists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.references :organisation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
