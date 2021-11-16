class FlashcardList < ApplicationRecord
  belongs_to :lesson
  has_many :flashcards, dependent: :delete_all
end
