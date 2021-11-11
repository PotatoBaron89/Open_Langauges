# == Schema Information
#
# Table name: flashcards
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  side_one   :string
#  side_two   :string
#
class Flashcard < ApplicationRecord
  paginates_per 12

  has_rich_text :side_one
  has_rich_text :side_two

  has_many :lessons
  has_many :flashcard_courses, through: :lessons
  has_many :flashcards, through: :flashcard_courses
end
