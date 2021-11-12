# == Schema Information
#
# Table name: channel_users
#
#  id         :bigint           not null, primary key
#  channel_id :bigint           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ChannelUser < ApplicationRecord
  belongs_to :channel
  belongs_to :user
end
