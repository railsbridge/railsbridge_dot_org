# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.railsbridge.org/"

SitemapGenerator::Sitemap.create do

  def navigation_map
    # TODO: Get directly from helper...
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
        ["Advice for Teachers", :teacher_advice],
        ["Organize an Event", :organize],
        ["Host an Event", :host],
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

  def get_relative_path(named_route)
    relative_path = "#{named_route.to_s}_path"
    Rails.application.routes.url_helpers.send(relative_path.to_sym)
  end

  def change_frequency
    # TODO
  end

  def change_priority
    # TODO
  end

  def create_map
    navigation_map.each do |nav_group, links|
      links.each do |link_info|
        add(get_relative_path(link_info[1]))
      end
    end
  end

  create_map

  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
