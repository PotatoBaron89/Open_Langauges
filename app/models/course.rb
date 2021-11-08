class Course < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :class_list
  has_many :class_educator
  has_many :users, through: :class_list
  has_many :users, through: :class_educator
end
