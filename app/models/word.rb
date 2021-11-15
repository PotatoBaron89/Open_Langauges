# == Schema Information
#
# Table name: words
#
#  id         :bigint           not null, primary key
#  word       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  Wordtype   :string
#
class Word < ApplicationRecord
  has_many :definitions, dependent: :delete_all
end
