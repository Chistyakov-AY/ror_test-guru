module AnswersHelper
  def answer_header(answer)
    if answer.persisted?
      t('helpers.answers.header_update', answer: @answer.body)
    else
      t('helpers.answers.header_create')
    end
  end
end
