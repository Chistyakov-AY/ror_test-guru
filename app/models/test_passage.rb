class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

  SUCCESS_PERCENT = 85

  def completed?
    current_question.nil?
  end
  
  def test_passed?
    result_calculation >= SUCCESS_PERCENT
  end

  def result_calculation
    (correct_questions.to_f / test.questions.count) * 100
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def progress
    (current_question_number.to_f / test.questions.count) * 100
  end

  def current_question_number
    current_question_index + 1
  end
  
  private
  
  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
  
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end
  
  def correct_answers
    current_question.answers.correct
  end
  
  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_validation_set_next_question
      self.current_question = next_question  
  end

  def current_question_index
    test.questions.index(current_question)
  end
end
