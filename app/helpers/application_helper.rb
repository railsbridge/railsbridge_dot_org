module ApplicationHelper

  def page_title(title = nil)
    base_title = "RailsBridge"
    title ? "#{base_title} | #{title.join(' | ')}" : base_title
  end

  def nav_links_by_group
    {
      learn: [
        ["Overview", :learn],
        ["Upcoming Workshops", :events],
        ["FAQ", :learning_faq],
        ["Keep Learning", :learning_resources],
      ],
      help: [
        ["Overview", :help],
        ["Teach or TA", :teach],
        ["Teacher Advice", :teacher_advice],
        ["Organize an Event", :organize],
        ["Host an Event", :host],
        ["Donate", :donate],
        ["Donor FAQ", :donor_faq],
        ["Interest Form", :interest_form]
      ],
      about: [
        ["Overview", :about],
        ["Team", :team],
        ["Sponsors ", :sponsors],
        ["Chapters", :chapters],
        ["Past Events", :past_events],
        ["Projects", :projects]
      ]
    }
  end

  def nav_link(link_text, link)
    class_name = current_page?(link) ? 'is-selected' : ''
    content_tag(:li, class: class_name) do
      link_to link_text, link
    end
  end

  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end

end
