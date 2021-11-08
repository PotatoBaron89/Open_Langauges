# == Schema Information
#
# Table name: organisations
#
#  id         :bigint           not null, primary key
#  name       :string
#  location   :string
#  user_id    :bigint           not null
#  courses_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Organisation < ApplicationRecord
  belongs_to :user
  belongs_to :courses
end
