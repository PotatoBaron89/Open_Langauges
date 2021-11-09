# == Schema Information
#
# Table name: flashcard_courses
#
#  id           :bigint           not null, primary key
#  course_id    :bigint           not null
#  flashcard_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class FlashcardCourse < ApplicationRecord
  belongs_to :lesson
  belongs_to :flashcard
end
