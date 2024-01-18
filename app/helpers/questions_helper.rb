module QuestionsHelper
  def current_year
    Date.today.year
  end

  def github_url(author, repo)
    link_to "GitHub репозиторий", "https://www.github.com/#{author}/#{repo}/tree/master", target: :blank
  end
end
