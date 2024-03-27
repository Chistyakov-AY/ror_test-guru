module AnswersHelper
  def answer_header(answer)
    if answer.persisted?
      "Edit answer '#{answer.body}'"
    else
      "Create New Answer"
    end
  end
end
