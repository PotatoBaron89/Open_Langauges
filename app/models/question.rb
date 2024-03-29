# == Schema Information
#
# Table name: questions
#
#  id                  :bigint           not null, primary key
#  question            :string
#  answer              :string
#  quiz_id             :bigint           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  working_out_example :text
#  hint                :string
#  user_answer         :string
#
class Question < ApplicationRecord
  belongs_to :quiz

  validates :question, presence: true
  validates :answer, presence: true
end
