class ClassList < ApplicationRecord
  belongs_to :user
  belongs_to :course
  belongs_to :organisation
end
