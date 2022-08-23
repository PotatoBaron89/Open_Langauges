# == Schema Information
#
# Table name: lesson_vocabs
#
#  id         :bigint           not null, primary key
#  lesson_id  :bigint           not null
#  word_id    :bigint           not null
#  title      :string
#  language   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class LessonVocab < ApplicationRecord
  belongs_to :lesson
  belongs_to :word
end
