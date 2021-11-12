# == Schema Information
#
# Table name: channels
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Channel < ApplicationRecord
  has_many :channel_users, dependent: :destroy
  has_many :users, through: :channel_users
  has_many :messages, dependent: :destroy

  validates :name, presence: true

  paginates_per 6
end
