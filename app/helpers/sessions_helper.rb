module SessionsHelper
  def flash_messages
    content_tag :p, flash[:alert], class: 'flash alert' if flash[:alert]
  end
end
