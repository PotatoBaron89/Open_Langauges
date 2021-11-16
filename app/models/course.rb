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
#  cover      :string
#  Ispremium  :boolean
#  price      :decimal(8, 2)
#  isarchived :boolean
#
class Course < ApplicationRecord

  # belongs_to :creator, class_name: 'User'
  belongs_to :user
  has_many :lessons, dependent: :delete_all
  has_many :class_list, dependent: :destroy
  has_many :class_educator, dependent: :delete_all
  has_many :users, through: :class_list, dependent: :delete_all
  has_many :users, through: :class_educator, dependent: :delete_all
  has_many :tags, through: :tag_list, dependent: :delete_all
  has_many :categories, through: :course_category, dependent: :delete_all

  # SOCIAL / FEATURES
  has_many :likes, dependent: :delete_all
  has_many :subscribes, dependent: :delete_all
  has_many :wishes, dependent: :delete_all

  #CONTENT
  has_one_attached :cover_image, dependent: :purge_later


  has_rich_text :contents
end
