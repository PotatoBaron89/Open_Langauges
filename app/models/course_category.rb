# == Schema Information
#
# Table name: course_categories
#
#  id          :bigint           not null, primary key
#  course_id   :bigint           not null
#  category_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class CourseCategory < ApplicationRecord
  belongs_to :course
  belongs_to :category
end
