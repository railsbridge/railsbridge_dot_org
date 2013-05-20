module ApplicationHelper

  def page_title(title)
    base_title = "RailsBridge"
    title.empty? ? base_title : "#{base_title} | #{title.join(' | ')}"
  end

end
