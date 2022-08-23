# == Schema Information
#
# Table name: inboxes
#
#  id         :bigint           not null, primary key
#  message_id :bigint           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Inbox < ApplicationRecord
  has_many :messages, dependent: :delete_all
  belongs_to :user
end
