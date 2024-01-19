module QuestionsHelper
  def question_header(question)
    if question.persisted?
      "Edit question '#{question.body}'"
    else
      "Create New Questions"
    end
  end

end
