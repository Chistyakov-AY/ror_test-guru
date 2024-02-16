module ApplicationHelper
  def current_year
    Date.today.year
  end

  def github_url(author, repo)
    link_to "GitHub репозиторий", "https://github.com/#{author}/#{repo}/", target: :blank
  end
end
