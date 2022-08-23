# == Schema Information
#
# Table name: flashcards
#
#  id                :bigint           not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  side_one          :string
#  side_two          :string
#  flashcard_list_id :bigint           not null
#
class Flashcard < ApplicationRecord
  has_rich_text :side_one
  has_rich_text :side_two
  
  belongs_to :flashcard_list
  validates :side_one, presence: true
  validates :side_two, presence: true

end
