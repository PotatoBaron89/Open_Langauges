# == Schema Information
#
# Table name: tag_lists
#
#  id         :bigint           not null, primary key
#  course_id  :bigint           not null
#  tag_id     :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
#
# # FUTURE FEATURE, NOT IMPLEMENTED YET
class TagList < ApplicationRecord
  belongs_to :course
  belongs_to :tag
end
