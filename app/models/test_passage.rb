class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  # belongs_to :question
  belongs_to :current_question, class_name: 'Question', foreign_key: "question_id", optional: true

  before_validation :before_validation_set_first_question, on: :create

private

  def before_validation_set_first_question
    self.current_question = test.question.first if test.present?
  end
end
