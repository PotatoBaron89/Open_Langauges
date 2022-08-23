# == Schema Information
#
# Table name: results
#
#  id          :bigint           not null, primary key
#  answer      :string
#  question    :string
#  user_id     :bigint           not null
#  quiz_id     :bigint           not null
#  status      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_answer :string
#
class Result < ApplicationRecord
  before_save :default_values

  belongs_to :user
  belongs_to :quiz

  enum status: [:ungraded, :correct, :incorrect, :exempt]
  def default_values
    self.status ||= 0
  end
end
