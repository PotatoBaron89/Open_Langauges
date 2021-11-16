class Category < ApplicationRecord
  belongs_to :course_category
  has_many :courses, through: :course_category, dependent: :delete_all
end
