class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string, limit: 25, default: 'Anon'
    add_column :users, :dob, :date
  end
end
