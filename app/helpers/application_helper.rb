module ApplicationHelper

  def page_title(title)
    base_title = "RailsBridge"
    title.empty? ? base_title : "#{base_title} | #{title.join(' | ')}"
  end

  def header_link(link_text, link)
    path_regex = /^\/#{link_text.downcase}/
    class_name = (current_page?(link) || request.path.match(path_regex)) ? 'selected' : ''
    content_tag(:li, class: class_name, id: link_text.downcase) do
      concat link_to link_text, link
      concat content_tag(:span)
    end
  end

  def nav_link(link_text, link)
    class_name = current_page?(link) ? 'selected' : ''
    content_tag(:li, class: class_name) do
      link_to link_text, link
    end
  end

end
