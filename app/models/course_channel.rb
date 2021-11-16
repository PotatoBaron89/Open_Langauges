# == Schema Information
#
# Table name: course_channels
#
#  id         :bigint           not null, primary key
#  message_id :bigint           not null
#  course_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CourseChannel < ApplicationRecord
  belongs_to :message
  belongs_to :course
end
