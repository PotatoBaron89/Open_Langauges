# == Schema Information
#
# Table name: flashcard_lists
#
#  id           :bigint           not null, primary key
#  flashcard_id :bigint
#  lesson_id    :bigint           not null
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class FlashcardList < ApplicationRecord
  belongs_to :lesson
  has_many :flashcards, dependent: :delete_all
end
