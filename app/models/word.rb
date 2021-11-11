# == Schema Information
#
# Table name: words
#
#  id         :bigint           not null, primary key
#  word       :string
#  class      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Word < ApplicationRecord
  paginates_per 50

  has_many :definitions, dependent: :delete_all
end
