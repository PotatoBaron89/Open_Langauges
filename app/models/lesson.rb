# == Schema Information
#
# Table name: lessons
#
#  id         :bigint           not null, primary key
#  title      :string
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint           not null
#
class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_rich_text :content

  has_many :flashcards, dependent: :delete_all
  has_many :flashcard_courses, through: :flashcards, dependent: :delete_all
  has_many :flashcards, through: :flashcard_courses, dependent: :delete_all
end
