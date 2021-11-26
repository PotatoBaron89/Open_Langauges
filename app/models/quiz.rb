# == Schema Information
#
# Table name: quizzes
#
#  id                :bigint           not null, primary key
#  lesson_id         :bigint           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  title             :string
#  is_test           :boolean
#  multiple_attempts :boolean
#  hints_enabled     :boolean
#
class Quiz < ApplicationRecord
  belongs_to :lesson
  has_many :questions, dependent: :delete_all
  has_many :results

  # has_many :results, through: :lesson_results, dependent: destroy_all

  validates :title, presence: true
end
