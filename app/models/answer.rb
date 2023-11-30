class Answer < ApplicationRecord
  validates :body, presence: true
  validate :validate_answers_to_questions

  belongs_to :question

  scope :right_answers, -> { where(correct: true) }

  def validate_answers_to_questions
    errors.add(:question) if question.answers.count >= 4
  end
end
