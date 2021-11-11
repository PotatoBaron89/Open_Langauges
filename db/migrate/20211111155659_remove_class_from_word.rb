class RemoveClassFromWord < ActiveRecord::Migration[6.1]
  def change
    remove_column :words, :class, :string
  end
end
