class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  # belongs_to :question
  belongs_to :current_question, class_name: 'Question', foreign_key: "question_id", optional: true
end
