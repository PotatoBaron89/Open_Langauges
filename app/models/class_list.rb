# == Schema Information
#
# Table name: class_lists
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  course_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ClassList < ApplicationRecord
  paginates_per 12

  belongs_to :user
  belongs_to :course
end
