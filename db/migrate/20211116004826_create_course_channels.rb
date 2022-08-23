class CreateCourseChannels < ActiveRecord::Migration[6.1]
  def change
    create_table :course_channels do |t|
      t.references :message, null: false, foreign_key: true
      t.belongs_to :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
