# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  first_name             :string
#  last_name              :string
#  dob                    :date
#  display_name           :string
#  about                  :text
#  image                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  timezone               :string
#
class User < ApplicationRecord

  before_save :default_values
  # validates :user, uniqueness: { scope: :course_id }

  # Include default devise modules. Others available are:
  #
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable
         # :confirmable, :lockable, :timeoutable, :trackable,
         # :omniauthable

  # FILES
  has_one_attached :image, dependent: :purge_later

  # JOIN TABLES
  has_many :class_list, dependent: :delete_all
  has_many :class_educator, dependent: :delete_all

  # COURSE ROLES
  has_many :course, foreign_key: 'user_id', dependent: :delete_all
  has_many :courses, through: :class_list, dependent: :delete_all
  has_many :courses, through: :class_educator, dependent: :delete_all




  # SOCIAL / FEATURES
  has_many :likes, dependent: :delete_all
  has_many :subscribes, dependent: :delete_all
  has_many :wishes, dependent: :delete_all

  def name
    return first_name
  end

  def default_values
    self.first_name ||= 'Anon'
  end

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: "100x100!").processed
    else
      "/default_avatar.png"
    end
  end
end
