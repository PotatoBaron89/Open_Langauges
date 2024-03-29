# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  channel_id :bigint           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Message < ApplicationRecord
  belongs_to :channel
  belongs_to :user
  has_rich_text :body

  validates :body, presence: true
end
