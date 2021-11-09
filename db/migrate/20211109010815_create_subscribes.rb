class CreateSubscribes < ActiveRecord::Migration[6.1]
  def change
    create_table :subscribes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end

    add_index :subscribes, [:user_id, :course_id], unique: true
  end
end
