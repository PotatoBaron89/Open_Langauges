class AddUserAnswerToQuestion < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :user_answer, :string
  end
end
