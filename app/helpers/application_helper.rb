module ApplicationHelper

  def page_title(title = nil)
    base_title = "RailsBridge"
    title ? "#{base_title} | #{title.join(' | ')}" : base_title
  end

  def nav_link(link_text, link)
    class_name = current_page?(link) ? 'is-selected' : ''
    content_tag(:li, class: class_name) do
      link_to link_text, link
    end
  end

end
