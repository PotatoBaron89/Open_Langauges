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

  has_many :flashcard_lists, dependent: :delete_all
  has_many :flashcards, through: :flashcard_lists, dependent: :delete_all
  has_many :quizzes, dependent: :delete_all
  # has_many :flashcards, through: :flashcard_list, dependent: :delete_all

  validates :title, presence: true
end
