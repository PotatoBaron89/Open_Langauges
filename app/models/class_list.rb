class ClassList < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_one :organisation
end
