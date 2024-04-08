module AnswersHelper
  def answer_header(answer)
    if answer.persisted?
      t('helpers.questions.header_update')
    else
      t('helpers.questions.header_create')
    end
  end
end
