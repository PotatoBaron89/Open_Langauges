# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
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
#  first_name             :string(25)
#  timezone               :string
#
class User < ApplicationRecord

  before_save :default_values

  # Include default devise modules. Others available are:
  #
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable
         # :confirmable, :lockable, :timeoutable, :trackable,
         # :omniauthable

  has_many :course, foreign_key: 'creator_id'
  has_many :class_list
  has_many :courses, through: :class_list
  has_many :courses, through: :class_educator

  def name
    return first_name
  end

  def default_values
    self.first_name ||= 'Anon'
  end
end
