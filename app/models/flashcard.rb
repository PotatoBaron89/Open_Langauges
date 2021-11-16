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
  has_rich_text :side_one
  has_rich_text :side_two
  
  belongs_to :flashcard_list
end
