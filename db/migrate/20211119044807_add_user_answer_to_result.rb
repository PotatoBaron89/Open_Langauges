class AddUserAnswerToResult < ActiveRecord::Migration[6.1]
  def change
    add_column :results, :user_answer, :string
  end
end
