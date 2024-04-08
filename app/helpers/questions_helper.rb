module QuestionsHelper
  def question_header(question)
    if question.persisted?
      t('helpers.questions.header_update')
    else
      t('helpers.questions.header_create')
    end
  end
end
