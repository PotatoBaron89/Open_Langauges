class RemoveLessonIdFromResults < ActiveRecord::Migration[6.1]
  def change
    remove_column :results, :lesson_results_id, :bigint
  end
end
