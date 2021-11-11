class AddWordtypeToWord < ActiveRecord::Migration[6.1]
  def change
    add_column :words, :Wordtype, :string
  end
end
