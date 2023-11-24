class Answer < ApplicationRecord
  validates :body, presence: true

  belongs_to :question

  scope :right_answers, -> { where(correct: false) }
end
