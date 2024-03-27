module ApplicationHelper
  def current_year
    Date.today.year
  end

  def github_url(author, repo)
    link_to "GitHub репозиторий", "https://github.com/#{author}/#{repo}/", target: :blank
  end

  def flash_message
    if flash.present?  
      flash.each do |type, message|
        content_tag :p, message, class: "flash #{type}" if flash[type]
      end
    end  
  end
end
