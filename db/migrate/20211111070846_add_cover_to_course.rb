class AddCoverToCourse < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :cover, :string
  end
end
