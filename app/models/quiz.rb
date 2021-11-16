# == Schema Information
#
# Table name: quizzes
#
#  id         :bigint           not null, primary key
#  lesson_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string
#
class Quiz < ApplicationRecord
  belongs_to :lesson
  has_many :questions, dependent: :delete_all
end
