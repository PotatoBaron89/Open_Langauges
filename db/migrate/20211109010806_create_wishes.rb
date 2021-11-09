class CreateWishes < ActiveRecord::Migration[6.1]
  def change
    create_table :wishes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end

    add_index :wishes, [:user_id, :course_id], unique: true
  end
end
