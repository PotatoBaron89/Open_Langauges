class CourseChannel < ApplicationRecord
  belongs_to :message
  belongs_to :course
end
