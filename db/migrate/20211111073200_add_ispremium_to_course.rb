class AddIspremiumToCourse < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :Ispremium, :boolean
  end
end
