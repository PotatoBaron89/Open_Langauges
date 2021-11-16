class Result < ApplicationRecord
  before_save :default_values

  belongs_to :user
  belongs_to :quiz

  enum status: [:ungraded, :correct, :incorrect, :exempt]
  def default_values
    self.status ||= 0
  end
end
