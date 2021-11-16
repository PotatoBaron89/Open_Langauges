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
  rolify

  before_save :default_values
  after_create :assign_default_role
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

  #CHAT FUNCTIONALITY
  has_many :channel_users, dependent: :destroy
  has_many :channels, through: :channel_users
  has_many :messages, dependent: :destroy

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

  # STUDENT RELATED
  has_many :results, dependent: :delete_all
  has_many :results, through: :lesson_results, dependent: :delete_all
  has_many :lesson_results, dependent: :delete_all


  def default_values
    self.first_name ||= 'Anon'
  end

  def assign_default_role
    self.add_role(:User)
  end

  def name
    self.first_name
  end

end
