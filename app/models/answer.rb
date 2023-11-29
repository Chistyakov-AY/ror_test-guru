class Answer < ApplicationRecord
  validates :body, presence: true
  validate :limiting_reporting_for_questions

  belongs_to :question

  scope :right_answers, -> { where(correct: true) }

  def limiting_reporting_for_questions
    errors.add(:question) if question.answers.count >= 4
  end
end
