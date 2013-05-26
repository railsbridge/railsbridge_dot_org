module ApplicationHelper

  def page_title(title)
    base_title = "RailsBridge"
    title.empty? ? base_title : "#{base_title} | #{title.join(' | ')}"
  end

  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''
    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end

end
