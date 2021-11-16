# == Schema Information
#
# Table name: flashcard_courses
#
#  id           :bigint           not null, primary key
#  flashcard_id :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  lesson_id    :bigint
#
class FlashcardCourse < ApplicationRecord

end
