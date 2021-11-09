# == Schema Information
#
# Table name: lessons
#
#  id         :bigint           not null, primary key
#  title      :string
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Lesson < ApplicationRecord
  belongs_to :user
  has_rich_text :content

  has_many :flashcards
  has_many :flashcard_courses, through: :flashcards
  has_many :flashcards, through: :flashcard_courses
end