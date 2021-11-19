class AddisTestToQuizzes < ActiveRecord::Migration[6.1]
  def change
    add_column :quizzes, :is_test, :boolean
    add_column :quizzes, :multiple_attempts, :boolean
    add_column :quizzes, :hints_enabled, :boolean
    add_column :questions, :working_out_example, :text
    add_column :questions, :hint, :string
  end
end
