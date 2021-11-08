class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.text :contents
      t.string :image_url
      # t.references :creator, null: false, foreign_key: true
      t.timestamps
    end


  end
end
