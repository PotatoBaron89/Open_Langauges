class Message < ApplicationRecord
  belongs_to :channel
  belongs_to :user
  has_rich_text :body
end
