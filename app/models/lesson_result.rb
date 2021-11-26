# == Schema Information
#
# Table name: lesson_results
#
#  id         :bigint           not null, primary key
#  lesson_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quiz_id    :bigint           not null
#  user_id    :bigint           not null
#
class LessonResult < ApplicationRecord

  # FUTURE FEATURE, NOT IMPLEMENTED YET
  # Might not need this table??
  # belongs_to :user
  # belongs_to :quiz
end
