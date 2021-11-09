# == Schema Information
#
# Table name: courses
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  contents   :text
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
class Course < ApplicationRecord
  # belongs_to :creator, class_name: 'User'
  belongs_to :user
  has_many :class_list, dependent: :destroy
  has_many :class_educator, dependent: :destroy
  has_many :users, through: :class_list
  has_many :users, through: :class_educator

  # SOCIAL / FEATURES
  has_many :likes, dependent: :destroy
  has_many :subscribes, dependent: :destroy
  has_many :wishes, dependent: :destroy

  #CONTENT



  has_rich_text :contents
end
