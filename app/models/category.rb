# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
#
# # FUTURE FEATURE, NOT IMPLEMENTED YET
class Category < ApplicationRecord
  belongs_to :course_category
  has_many :courses, through: :course_category, dependent: :delete_all
end
