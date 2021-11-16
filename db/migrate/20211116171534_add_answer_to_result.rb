class AddAnswerToResult < ActiveRecord::Migration[6.1]
  def change
    add_column :results, :answer, :string
  end
end
