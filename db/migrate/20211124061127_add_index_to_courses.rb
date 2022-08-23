class AddIndexToCourses < ActiveRecord::Migration[6.1]
  def change
    add_index :courses, :title
    add_index :courses, :Ispremium
  end
end
