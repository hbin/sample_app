module ApplicationHelper
  def full_title(page_title)
    base_title = 'Ruby on Rails Tutorial Sample App'

    if page_title.blank?
      base_title
    else
      "#{base_title} | #{page_title}".html_safe
    end
  end
end