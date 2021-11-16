class Tag < ApplicationRecord
  belongs_to :tag_list
  has_many :courses, through: :tag_list, dependent: :delete_all
end
