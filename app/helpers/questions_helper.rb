module QuestionsHelper
  def question_header(question)
    if question.persisted?
      t('helpers.questions.header_update', question: @question.body)
    else
      t('helpers.questions.header_create')
    end
  end
end
