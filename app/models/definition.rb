# == Schema Information
#
# Table name: definitions
#
#  id         :bigint           not null, primary key
#  title      :string
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  word_id    :bigint           not null
#
class Definition < ApplicationRecord
  belongs_to :word
end
