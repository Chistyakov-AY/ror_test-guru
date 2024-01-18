module QuestionsHelper
  def current_year
    Date.today.year
  end

  def github_url(author, repo)
    link_to "GitHub репозиторий", "https://github.com/#{author}/#{repo}/", target: :blank
  end

  def question_header(question)
    if question.persisted?
      "Edit question '#{question.body}'"
    else
      "Create New Questions"
    end
  end
end
