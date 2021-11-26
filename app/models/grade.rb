# == Schema Information
#
# Table name: grades
#
#  id         :bigint           not null, primary key
#  score      :string
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
#
# # FUTURE FEATURE, NOT IMPLEMENTED YET
class Grade < ApplicationRecord
  belongs_to :user
end
