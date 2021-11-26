# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
#
#
# # FUTURE FEATURE, NOT IMPLEMENTED YET
class Tag < ApplicationRecord
  belongs_to :tag_list
  has_many :courses, through: :tag_list, dependent: :delete_all
end
